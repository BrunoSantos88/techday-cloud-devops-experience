resource "google_compute_firewall" "jenkins" {
  name          = "jenkins"
  network       = "default"  # Change to your network if needed
  priority      = 1000       # Adjust the priority as needed

  source_ranges = ["0.0.0.0/0"]  # Be cautious with this; restrict the source IP range if possible

  # Define the allowed ports
  allow {
    protocol = "tcp"
    ports    = ["8080", "22"]  # Example ports (customize as needed)
  }

  # Specify the target tags to associate this rule with instances
  target_tags   = ["jenkins-instance"]
}