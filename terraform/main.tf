resource "aws_s3_bucket" "app_bucket" {
  bucket = "sample-app-terraform-bucket-12345"
  acl    = "private"                        # Fixed: Changed from public-read to private for security
}

resource "aws_iam_policy" "app_policy" {
  name        = "app-restricted-access"      # Changed name to reflect restricted access
  description = "Policy with least privilege access for instances"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [                           # Fixed: Replaced "*" with specific required actions
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject"
      ],
      "Resource": [                         # Fixed: Replaced "*" with specific bucket ARN
        "arn:aws:s3:::sample-app-terraform-bucket-12345",
        "arn:aws:s3:::sample-app-terraform-bucket-12345/*"
      ]
    }
  ]
}
EOF
}

resource "aws_security_group" "open_sg" {
  name        = "open-sg"
  description = "Security group with wide open access"
}