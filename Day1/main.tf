variable "instance_ami" {
  type = string
  description = "AMI for aws EC2 instance"
  default = "ami-0cf31d971a3ca20d6"
}
variable "instance_type" {
  type = string 
  description = "type for aws EC2 instance"
  default = "t2.micro"
}

resource "aws_s3_bucket" "bucker123" {
  bucket = "my-tf-test-bucket123"
  acl    = "private"

  tags = {
    Name        = "My bucket123"
    Environment = "Dev"
  }
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
  )

  tags = {
      tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.test_role.name
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.test_role.id

  policy =jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::my-tf-test-bucket123",
                "arn:aws:s3:::my-tf-test-bucket123/*"
            ]
        }
  ]
}
  )
}

resource "aws_instance" "role-test" {
  ami = var.instance_ami
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  #key_name = "mytestpubkey"
  tags = {
    Name = "My instance"
  }
}