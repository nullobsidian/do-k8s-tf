variable "cluster_name" {}
variable "environment" {}
variable "dns_zone" {}
variable "k8s_region" {}
variable "k8s_version" {}
variable "node_pool_name" {}
variable "node_size" {}
variable "node_count" {}
variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "main" {
  name    = "${var.cluster_name}"
  region  = "${var.k8s_region}"
  // Grab the latest version slug from `doctl kubernetes options versions`
  version = "${var.k8s_version}"
  tags    = ["${var.environment}","${var.dns_zone}"]

  node_pool {
    name       = "${var.node_pool_name}"
    size       = "${var.node_size}"
    node_count = "${var.node_count}"
  }
}
