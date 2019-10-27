variable "cluster_name" {}
variable "envrionment" {}
variable "dns_zone" {}
variable "k8s_region" {}
variable "node_pool_name" {}
variable "node_size" {}
variable "node_count" {}

resource "digitalocean_kubernetes_cluster" "main" {
  name    = "${var.cluster_name}"
  region  = "${var.k8s_region}"
  // Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.15.5-do.0"
  tags    = ["${var.envrionment}","${var.dns_zone}"]

  node_pool {
    name       = "${var.node_pool_name}"
    size       = "${var.node_size}"
    node_count = "${var.node_count}"
  }
}
