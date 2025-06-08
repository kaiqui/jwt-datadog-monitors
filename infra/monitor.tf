resource "datadog_monitor" "ECS_-_JWT_API_Consumo_de_CPU_Acima_do_Esperado" {
  new_group_delay = 60
  require_full_window = false
  monitor_thresholds {
    critical = 80
    warning = 70
  }
  name = "[ECS - JWT API] Consumo de CPU Acima do Esperado"
  type = "query alert"
  query = <<EOT
avg(last_5m):avg:ecs.fargate.cpu.percent{aws_account:278119224443} by {availability-zone} > 80
EOT
  message = <<EOT
Alerta Consumo de CPU acima do esperado

@webhook-discord-alert
EOT
}


resource "datadog_monitor" "ECS_-_JWT_API_Consumo_de_Memoria_Acima_do_Esperado" {
  include_tags = false
  require_full_window = false
  monitor_thresholds {
    critical = 80
    warning = 70
  }
  name = "[ECS - JWT API] Consumo de Memoria Acima do Esperado"
  type = "query alert"
  query = <<EOT
avg(last_5m):(avg:ecs.fargate.mem.usage{ecs_cluster:ecs-cluster , ecs_service:jwt-validator} / avg:ecs.fargate.mem.task.limit{cluster_name:ecs-cluster , ecs_service:jwt-validator}) * 100 > 80
EOT
  message = <<EOT
Consumo de Memoria Acima do Esperado

@webhook-discord-alert
EOT
}

resource "datadog_monitor" "JWT-API_Erros_Acima_do_Esperado" {
  new_group_delay = 60
  require_full_window = false
  monitor_thresholds {
    critical = 5
    warning = 3
  }
  name = "[JWT-API] Erros Acima do Esperado"
  type = "query alert"
  query = <<EOT
sum(last_5m):(sum:trace.servlet.request.hits{service:jwt-validator ,resource_name:*valid*, !http.status_code:200} by {resource_name}.as_count() / sum:trace.servlet.request.hits{service:jwt-validator ,resource_name:*valid*} by {resource_name}.as_count()) * 100 > 5
EOT
  message = <<EOT
**Alerta de Taxa de Erros — jwt-validator**

A taxa de respostas **não-200** para o recurso `*valid*` no serviço `jwt-validator` excedeu o limite.

-   **Limite configurado:** > 5% de erros nos últimos 5 minutos

@webhook-discord-alert
EOT
}

resource "datadog_monitor" "JWT-API_Latencia_P95_Acima_do_Esperado" {
  new_group_delay = 60
  require_full_window = false
  monitor_thresholds {
    critical = 80
    warning = 60
  }
  name = "[JWT-API] Latencia P95 Acima do Esperado"
  type = "query alert"
  query = <<EOT
percentile(last_5m):p95:trace.servlet.request{service:jwt-validator, resource_name:*validat*} by {resource_name} > 80
EOT
  message = <<EOT
Alerta de Latência — P95 — jwt-validator

O percentil 95 (P95) da duração das requisições para o recurso `*valid*` no serviço `jwt-validator` está elevado.

- 🚩 Threshold de warning: > 60 ms
- 🚩 Threshold de critical: > 80 ms

@webhook-discord-alert
EOT
}