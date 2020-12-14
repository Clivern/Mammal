{{/*
Expand the name of the chart.
*/}}
{{- define "mammal.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mammal.image" -}}
{{- printf "%s:v%s" .Values.image .Chart.AppVersion }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "mammal.labels" -}}
helm.sh/chart: {{ include "mammal.name" . }}
{{ include "mammal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "mammal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mammal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
