resource "aws_s3_bucket" "bucketbox123" {
  bucket = "shivanisarthibucket"
  acl    = "private"

  tags = {
    Name        = "bucketbox123"
    Environment = "Prod"
  }
}
