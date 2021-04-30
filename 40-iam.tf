resource "aws_iam_instance_profile" "app" {
  name = "fr-role-${local.tags["wavestone:project"]}-${var.environment}"
  role = aws_iam_role.app.name
}

resource "aws_iam_role" "app" {
  name               = "fr-role-${local.tags["wavestone:project"]}-${var.environment}"
  description        = "IAM role for ${local.tags["wavestone:project"]}-${var.environment}"
  
  assume_role_policy = <<EOF
{
    "Version" : "2012-10-17",
    "Statement" : [
    {
        "Action" : "sts:AssumeRole",
        "Principal" : {
        "Service" : "ec2.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
    }
    ]
}
EOF

  tags = merge(local.tags,{"Name"="fr-${local.tags["wavestone:project"]}-role-${var.environment}"})
}

resource "aws_iam_role_policy_attachment" "ssmcore"{
    role = aws_iam_role.app.name
    policy_arn = data.aws_iam_policy.ssmcore.arn
}

