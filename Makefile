# groot-share-selfhosted — optional automation targets (no Go build).

.DEFAULT_GOAL := help

COMPOSE_MINIMAL := run/docker-compose/minimal/docker-compose.yml
COMPOSE_TRAEFIK := run/docker-compose/traefik/docker-compose.yml
ENV_EXAMPLE := run/common/.env.example
CHART_DIR ?= run/kubernetes/helm/gfs
KUBERNETES_VERSION ?= 1.30.0
RELEASE_CHECK_DATA := data/release-check

GREEN  := \033[0;32m
YELLOW := \033[0;33m
CYAN   := \033[0;36m
RESET  := \033[0m

.PHONY: help release-check

help:
	@echo "$(GREEN)groot-share-selfhosted$(RESET) — deployment manifests (Compose, Helm, run/)"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "$(YELLOW)Release:$(RESET)"
	@echo "  $(GREEN)release-check$(RESET)             helm lint/template/kubeconform + Compose config."
	@echo "                                 Needs: helm, kubeconform, docker."
	@echo ""
	@echo "$(YELLOW)Day-to-day:$(RESET)"
	@echo "  export GFS_HOST_DATA=/path/outside/clone"
	@echo "  ./run/scripts/compose-stack.sh minimal up -d"
	@echo "  ./run/scripts/compose-stack.sh traefik up -d"
	@echo ""
	@echo "$(CYAN)Examples:$(RESET)"
	@echo "  make release-check"

release-check:
	@command -v helm >/dev/null 2>&1 || { echo "helm not found"; exit 1; }
	@command -v kubeconform >/dev/null 2>&1 || { echo "kubeconform not found (brew install kubeconform)"; exit 1; }
	@command -v docker >/dev/null 2>&1 || { echo "docker not found"; exit 1; }
	@echo "release-check: helm lint $(CHART_DIR)..."
	@helm lint "$(CHART_DIR)"
	@echo "release-check: helm template + kubeconform (inline bootstrap)..."
	@helm template test-rel "$(CHART_DIR)" --namespace test-ns \
		--set bootstrap.admin=lab-admin \
		--set bootstrap.password=lab-password-ok | \
		kubeconform -strict -kubernetes-version "$(KUBERNETES_VERSION)" -summary -
	@echo "release-check: helm template + kubeconform (existing Secret)..."
	@helm template test-rel "$(CHART_DIR)" --namespace test-ns \
		--set bootstrap.existingSecret=gfs-bootstrap | \
		kubeconform -strict -kubernetes-version "$(KUBERNETES_VERSION)" -summary -
	@echo "release-check: helm template + kubeconform (vps-s3)..."
	@helm template test-rel "$(CHART_DIR)" --namespace test-ns \
		--set bootstrap.existingSecret=gfs-bootstrap \
		--set topology=vps-s3 \
		--set s3.bucket=captures \
		--set s3.existingSecret=gfs-s3 | \
		kubeconform -strict -kubernetes-version "$(KUBERNETES_VERSION)" -summary -
	@mkdir -p "$(RELEASE_CHECK_DATA)"
	@sed 's|^GFS_HOST_DATA=.*|GFS_HOST_DATA=$(CURDIR)/$(RELEASE_CHECK_DATA)|' \
		"$(ENV_EXAMPLE)" > "$(RELEASE_CHECK_DATA)/.env"
	@echo "GFS_BOOTSTRAP_ADMIN=lab-admin" >> "$(RELEASE_CHECK_DATA)/.env"
	@echo "GFS_BOOTSTRAP_PASSWORD=lab-password-ok" >> "$(RELEASE_CHECK_DATA)/.env"
	@echo "release-check: docker compose config (minimal)..."
	@docker compose --env-file "$(RELEASE_CHECK_DATA)/.env" -f "$(COMPOSE_MINIMAL)" config >/dev/null
	@echo "ACME_EMAIL=lab@example.com" >> "$(RELEASE_CHECK_DATA)/.env"
	@echo "GFS_HOSTNAME=gfs.example.com" >> "$(RELEASE_CHECK_DATA)/.env"
	@echo "release-check: docker compose config (traefik)..."
	@docker compose --env-file "$(RELEASE_CHECK_DATA)/.env" -f "$(COMPOSE_TRAEFIK)" config >/dev/null
	@echo "release-check: compose-stack.sh help..."
	@./run/scripts/compose-stack.sh --help >/dev/null
	@echo "release-check passed."
