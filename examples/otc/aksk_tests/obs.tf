resource "opentelekomcloud_s3_bucket" "example_bucket" {
  region = "${var.region}"  
  bucket = "examplebucket"
  acl =  "public-read-write"
}

resource "opentelekomcloud_s3_bucket_object" "example_object" {
  source         = "./s3_test.txt"
  bucket = "${opentelekomcloud_s3_bucket.example_bucket.id}"
  key           = "example"
  acl =  "public-read-write"
  

  content_type = "application/txt"
}
