resource "aws_iam_role" "overprovisioned" {
  name               = "overprovisioned"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
  
  inline_policy {
    name = "my_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["s3:*"]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }

}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_instance_profile" "overprovisioned__profile" {
  name = "overprovisioned_profile"
  role = aws_iam_role.overprovisioned.name
}