provider "aws" {
  region = "us-west-2"
}

# Create S3 Bucket for tenant1
resource "aws_s3_bucket" "tenant1_bucket" {
  bucket = "tenant1-portfolio-bucket"
  acl    = "public-read"
}

# Create CloudFront Distribution for tenant1
resource "aws_cloudfront_distribution" "tenant1_distribution" {
  origin {
    domain_name = aws_s3_bucket.tenant1_bucket.bucket_regional_domain_name
    origin_id   = "S3-tenant1-origin"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/EXAMPLE"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for tenant1 portfolio"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = "S3-tenant1-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods {
      cached_methods = ["GET", "HEAD"]
      methods        = ["GET", "HEAD"]
    }
  }

  price_class = "PriceClass_100"

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

output "tenant1_cloudfront_url" {
  value = aws_cloudfront_distribution.tenant1_distribution.domain_name
}
