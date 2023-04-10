{{/*
Expand the name of the chart.
*/}}
{{- define "lavalink-music.name" -}}
{{- default .Chart.Name .Values.Lavalink.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lavalink-music.fullname" -}}
{{- if .Values.Lavalink.fullnameOverride }}
{{- .Values.Lavalink.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.Lavalink.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lavalink-music.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lavalink-music.labels" -}}
helm.sh/chart: {{ include "lavalink-music.chart" . }}
{{ include "lavalink-music.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lavalink-music.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lavalink-music.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "lavalink-music.serviceAccountName" -}}
{{- if .Values.Lavalink.serviceAccount.create }}
{{- default (include "lavalink-music.fullname" .) .Values.Lavalink.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.Lavalink.serviceAccount.name }}
{{- end }}
{{- end }}
