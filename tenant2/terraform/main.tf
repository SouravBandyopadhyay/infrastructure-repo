provider "aws" {
  region = "us-west-2"
}

# Create S3 Bucket for tenant2
resource "aws_s3_bucket" "tenant2_bucket" {
  bucket = "tenant2-portfolio-bucket"
  acl    = "public-read"
}

# Create CloudFront Distribution for tenant2
resource "aws_cloudfront_distribution" "tenant2_distribution" {
  origin {
    domain_name = aws_s3_bucket.tenant2_bucket.bucket_regional_domain_name
    origin_id   = "S3-tenant2-origin"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/EXAMPLE"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for tenant2 portfolio"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = "S3-tenant2-origin"
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

output "tenant2_cloudfront_url" {
  value = aws_cloudfront_distribution.tenant2_distribution.domain_name
}
