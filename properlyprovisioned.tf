resource "aws_iam_role" "properlyprovisioned" {
  name               = "properlyprovisioned"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
  
  inline_policy {
    name = "my_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["s3:List*"]
          Effect   = "Allow"
          Resource = ["arn:aws:s3:::project-secured-bucket-spring-2024",
          "arn:aws:s3:::project-secured-bucket-spring-2024/*"]
        },
      ]
    })
  }

}



resource "aws_iam_instance_profile" "properlyprovisioned_profile" {
  name = "properlyprovisioned_profile"
  role = aws_iam_role.properlyprovisioned.name
}