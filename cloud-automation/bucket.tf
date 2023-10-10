resource "google_storage_bucket" "private_bucket" {
  name          = "devopsmentoriaprivate"                    
  location      = "US"                                          
  storage_class = "STANDARD"                                     
}

resource "google_storage_bucket" "public_bucket" {
  name          = "devopsmentoriapublic"
  location      = "US" 
  storage_class = "STANDARD" 

  versioning {
    enabled = true
  }
}