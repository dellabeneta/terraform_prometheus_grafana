resource "aws_s3_bucket" "s3_bucket" {
  bucket        = "dellops-stack-monitoramento"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = "dellops-stack-monitoramento"
  acl    = "private"
}

resource "aws_s3_object" "s3_object" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    = "prometheus.yml"
  acl    = "public-read"
  source = "prometheus.yml"
  etag   = filemd5("prometheus.yml")
}