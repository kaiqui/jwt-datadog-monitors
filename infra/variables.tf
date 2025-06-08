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