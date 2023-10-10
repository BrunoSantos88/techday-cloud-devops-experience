resource "google_storage_bucket" "private_bucket" {
  name          = "privatebucketdevops"                    
  location      = "US"                                          
  storage_class = "STANDARD"                                     
}