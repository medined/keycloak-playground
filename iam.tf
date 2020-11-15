resource "aws_iam_role" "keycloak" {
  name = "keycloak"
  path = "/"
  assume_role_policy = file("assume-role-policy.json")
}

resource "aws_iam_policy" "keycloak" {
  name        = "keycloak"
  path        = "/"
  description = "This role allows the instance to access Route53."
  policy      = file("iam-keycloak-policy.json")
}

resource "aws_iam_policy_attachment" "keycloak" {
  name       = "keycloak"
  roles      = [aws_iam_role.keycloak.name]
  policy_arn = aws_iam_policy.keycloak.arn
}

resource "aws_iam_instance_profile" "keycloak" {
  name = "keycloak"
  role = aws_iam_role.keycloak.name
}
