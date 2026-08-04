resource "helm_release" "nginx" {
  name = "nginx-ingress"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  create_namespace = true
  namespace        = "nginx-ingress"

  atomic          = true
  cleanup_on_fail = true
}

resource "helm_release" "cert_manager" {
  name = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.21.0"

  create_namespace = true
  namespace        = "cert-manager"

  set = [
    {
      name  = "crds.enabled"
      value = "true"
    }
  ]

  values = [
    file("${path.module}/helm-values/cert-manager.yaml")
  ]

  depends_on = [
    module.cert_manager_irsa_role
  ]
}

resource "helm_release" "external_dns" {
  name = "external-dns"

  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
  version    = "1.20.0"

  create_namespace = true
  namespace        = "external-dns"

  values = [
    file("${path.module}/helm-values/external-dns.yaml")
  ]

  depends_on = [
    module.external_dns_irsa_role
  ]
}

resource "helm_release" "argocd_deploy" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.19.15"
  timeout    = 600

  namespace        = "argo-cd"
  create_namespace = true

  values = [
    file("${path.module}/helm-values/argocd.yaml")
  ]
}