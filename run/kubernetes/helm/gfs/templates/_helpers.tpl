{{- define "gfs.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "gfs.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "gfs.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "gfs.bootstrapSecretName" -}}
{{- if .Values.bootstrap.existingSecret -}}
{{- .Values.bootstrap.existingSecret -}}
{{- else -}}
{{- .Values.bootstrap.secretName -}}
{{- end -}}
{{- end -}}

{{- define "gfs.s3SecretName" -}}
{{- if .Values.s3.existingSecret -}}
{{- .Values.s3.existingSecret -}}
{{- else -}}
{{- .Values.s3.secretName -}}
{{- end -}}
{{- end -}}
