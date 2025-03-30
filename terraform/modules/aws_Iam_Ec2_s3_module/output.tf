output "bucket_name" {
  value = aws_s3_bucket.my_s3_bucket.bucket
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.my_s3_bucket.bucket_regional_domain_name
}

output "bucket_arn" {
  value = aws_s3_bucket.my_s3_bucket.arn
}    


output "domain_name" {
    value = aws_s3_bucket.my_s3_bucket.bucket_regional_domain_name
  
}
        
