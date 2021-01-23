# resource "helm_release" "atlantis" {
#   name       = "atlantis"
#   repository = "https://runatlantis.github.io/helm-charts"
#   chart      = "atlantis"
#   namespace  = "ndigital"

#   values = [
#     file("atlantis.yaml")
#   ]
# }