resource "google_container_cluster" "gke_cluster" {
  min_master_version = "${data.google_container_engine_versions.gke_versions.latest_master_version}"
  name               = "gke-cluster"

  
  network = "cluster-k8s-vpc"

  remove_default_node_pool = true

  addons_config {
    http_load_balancing {
      disabled = false
    }

    kubernetes_dashboard {
      disabled = true
    }
  }

  # Kubernetes master's external IP is only accessible from ${var.kubernetes_master_allowed_ip}
  master_authorized_networks_config {
  cidr_blocks {
    cidr_block = "10.0.0.0/18"
  }
}

private_cluster_config {
  enable_private_endpoint = true
  enable_private_nodes    = true
  master_ipv4_cidr_block  = "10.48.0.0/14"
}

  # Use ABAC until official Kubernetes plugin supports RBAC
  enable_legacy_abac = "true"

  # Enable alias IP addresses https://cloud.google.com/kubernetes-engine/docs/how-to/alias-ips
  ip_allocation_policy {
    create_subnetwork = true
    subnetwork_name   = "private"
  }

  lifecycle {
    ignore_changes = ["node_pool"]
  }

  node_pool {
    name = "default-pool"
  }
}

resource "google_container_node_pool" "gke_pool" {
  name       = "gke-pool"
  cluster    = google_container_cluster.gke_cluster.id
  node_count = "1"

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    disk_size_gb = 10
    machine_type = "e2-medium"
  }
}