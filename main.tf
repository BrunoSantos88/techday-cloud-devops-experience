module "gke0-public-networking" {
  source       = "./Rede-Conectvidade"
}

module "gke0-firewall" {
  source       = "./Firewall-public"
}

module "gke" {
  source       = "./Gke-devtest"
}

