resource "aws_kms_key" "my_kms_key" {
  description         = "My KMS Keys for Data Encryption"
  customer_master_key_spec = var.key_spec
  is_enabled               = var.enabled
  enable_key_rotation      = var.rotation_enabled  

  tags = {
    Name = "my_kms_key"
  }

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "auto-secretsmanager-2",
    "Statement": [
        {
            "Sid": "Allow access through AWS Secrets Manager for all principals in the account that are authorized to use AWS Secrets Manager",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:CreateGrant",
                "kms:DescribeKey"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "kms:CallerAccount": "679196758854",
                    "kms:ViaService": "secretsmanager.us-west-2.amazonaws.com"
                }
            }
        },
        {
            "Sid": "Allow access through AWS Secrets Manager for all principals in the account that are authorized to use AWS Secrets Manager",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "kms:GenerateDataKey*",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "kms:CallerAccount": "679196758854"
                },
                "StringLike": {
                    "kms:ViaService": "secretsmanager.*.amazonaws.com"
                }
            }
        },
        {
            "Sid": "Allow direct access to key metadata to the account",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::679196758854:root"
            },
            "Action": [
                "kms:Describe*",
                "kms:Get*",
                "kms:List*",
                "kms:RevokeGrant"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_kms_alias" "my_kms_alias" {
  target_key_id = aws_kms_key.my_kms_key.key_id
  name          = "alias/${var.kms_alias}"
}
