# resource "kubernetes_namespace" "ndigital" {
#   metadata {
#     name = "ndigital"
#   }
# }
# resource "kubernetes_deployment" "nginx" {
#   metadata {
#     name      = "nginx"
#     namespace = kubernetes_namespace.ndigital.metadata.0.name
#   }
#   spec {
#     replicas = 3
#     selector {
#       match_labels = {
#         app = "MyNginx"
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           app = "MyNginx"
#         }
#       }
#       spec {
#         container {
#           image = "nginx"
#           name  = "nginx-container"
#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }
# resource "kubernetes_service" "nginx" {
#   metadata {
#     name      = "nginx"
#     namespace = kubernetes_namespace.ndigital.metadata.0.name
#   }
#   spec {
#     selector = {
#       app = kubernetes_deployment.nginx.spec.0.template.0.metadata.0.labels.app
#     }
#     type = "NodePort"
#     port {
#       node_port   = 30201
#       port        = 80
#       target_port = 80
#     }
#   }
# }
