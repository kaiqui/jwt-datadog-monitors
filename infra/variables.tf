variable "datadog_api_key" {
  type        = string
  sensitive   = true
  description = "DataDog API Key"
}

variable "datadog_app_key" {
  type        = string
  sensitive   = true
  description = "DataDog App Key"
}

variable "discord_webhook_url" {
  type        = string
  sensitive   = true
  description = "URL do webhook do Discord"
}

variable "notify_discord" {
  type        = string
  default     = "@webhook-Discord-Alerts"
  description = "Mention para notificação no Discord"
}

# Thresholds
variable "healthy_tasks_threshold_critical" {
  type        = number
  description = "Porcentagem crítica de tarefas saudáveis"
}

variable "healthy_tasks_threshold_warning" {
  type        = number
  description = "Porcentagem de warning para tarefas saudáveis"
}

variable "error_rate_threshold_critical" {
  type        = number
  description = "Taxa crítica de erros 5xx (%)"
}

variable "error_rate_threshold_warning" {
  type        = number
  description = "Taxa de warning para erros 5xx (%)"
}

variable "latency_threshold_critical" {
  type        = number
  description = "Latência P95 crítica (ms)"
}

variable "latency_threshold_warning" {
  type        = number
  description = "Latência P95 para warning (ms)"
}

variable "cpu_threshold_critical" {
  type        = number
  description = "Utilização crítica de CPU (%)"
}

variable "cpu_threshold_warning" {
  type        = number
  description = "Utilização de CPU para warning (%)"
}

variable "memory_threshold_critical" {
  type        = number
  description = "Utilização crítica de memória (%)"
}

variable "memory_threshold_warning" {
  type        = number
  description = "Utilização de memória para warning (%)"
}

variable "healthcheck_failure_threshold_critical" {
  type        = number
  description = "Taxa crítica de falhas em health checks (%)"
}

variable "healthcheck_failure_threshold_warning" {
  type        = number
  description = "Taxa de warning para falhas em health checks (%)"
}

variable "success_rate_threshold_critical" {
  type        = number
  description = "Taxa crítica de sucesso (%)"
}

variable "success_rate_threshold_warning" {
  type        = number
  description = "Taxa de warning para sucesso (%)"
}

variable "traffic_anomaly_threshold" {
  type        = number
  description = "Limiar para detecção de anomalias de tráfego (%)"
}