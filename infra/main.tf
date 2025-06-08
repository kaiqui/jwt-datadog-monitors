resource "datadog_webhook" "discord_webhook" {
  name = "discord-alerts"
  url  = var.discord_webhook_url
}
