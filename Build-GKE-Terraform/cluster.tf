resource "google_container_cluster" "my-gke-cluster" {
  name     = "my-gke-cluster"
  location = "us-central1"
  network  = "cluster-k8s-vpc"
  subnetwork                    = "private"
  cluster_secondary_range_name  = "k8s-pod-range"
  services_secondary_range_name = "k8s-service-range"
  master_ipv4_cidr_block = "10.0.0.0/18"
  enable_private_nodes = "true"
  disable_public_endpoint = "true"

  master_authorized_networks_config = [
    {
      cidr_blocks = [
        {
          cidr_block   = "0.0.0.0/0"
          display_name = "all-for-testing"
       },
      ]
    },
  ]
}