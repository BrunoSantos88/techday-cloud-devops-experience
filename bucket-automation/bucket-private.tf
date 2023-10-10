resource "google_storage_bucket" "private_bucket" {
  name          = "privatebucketdevops"                    
  location      = "US"                                          
  storage_class = "STANDARD"                                     
}

resource "google_storage_bucket_iam_binding" "example_binding" {
  bucket = google_storage_bucket.private_bucket.name
  role   = "roles/storage.objectViewer"  # Essa é a função que concede a permissão 'storage.objects.list'


  members = [
    "user:devops-399217@appspot.gserviceaccount.com",  
     "user:brunosantosc1@gmail.com",
     "user:devops-399217@appspot.gserviceaccount.com",
  ]
}