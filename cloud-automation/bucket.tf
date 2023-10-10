resource "google_storage_bucket" "private_bucket" {
  name          = "devopsmentoriaprivate"                    
  location      = "US"                                          
  storage_class = "STANDARD"                                     
}