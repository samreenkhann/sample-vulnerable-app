resource "aws_iam_policy" "app_policy" {
  name        = "app-full-access"
  description = "Policy used by instances with least privilege access"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        # Added specific required actions instead of wildcard "*"
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket",
        "ec2:DescribeInstances",
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      "Resource": [
        # Specified exact resource ARNs instead of wildcard "*"
        "arn:aws:s3:::my-app-bucket/*",
        "arn:aws:s3:::my-app-bucket",
        "arn:aws:ec2:*:*:instance/*"
      ]
    }
  ]
}
EOF
}