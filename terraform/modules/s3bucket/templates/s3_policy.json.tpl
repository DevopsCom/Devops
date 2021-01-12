{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowList"
      "Effect": "Allow",
      "Principal": {
        "AWS":  "${all_userids}"
      },
      "Action": [
        "s3:ListBucketByTags",
        "s3:ListBucketLocation",
        "s3:ListBucket"
      ],
      "Resource": "arn:aws:s3:::${bucket_name}",
      "condition":  {
        "StringLike": {
          "aws:userId": "${all_userids}"
        }
      }
  },

    {
      "Sid": "AllowAction"
      "Effect": "Allow",
      "Principal": {
        "AWS":  "${all_userids}"
      },
      "Action": [
        "s3:GetObject",
        "s3:GetObjectTagging",
        "s3:DeleteObject",
        "s3:DeleteObjectTagging",
        "s3:DeleteObjectVersionTagging",
        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:PutObjectTagging"
      ],
      "Resource": "arn:aws:s3:::${bucket_name}/*"
      "condition":  {
        "StringLike": {
          "aws:userId": "${all_userids}"
        }
      }
    }
  ]
}
