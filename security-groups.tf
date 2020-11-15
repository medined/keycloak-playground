
#
# Ingress
#

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ var.ssh_cidr_block ]
  }

  tags = {
    Name = "keycloak"
  }
}

resource "aws_security_group" "allow_keycloak" {
  name        = "allow_keycloak"
  description = "Allow KeyCloak"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 9001
    to_port     = 9001
    protocol    = "tcp"
    cidr_blocks = [ var.ssh_cidr_block ]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [ var.ssh_cidr_block ]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = [ var.ssh_cidr_block ]
  }

  tags = {
    Name = "keycloak"
  }
}

#
# Egress
#

resource "aws_security_group" "allow_any_outbound" {
  name        = "allow_any_outbound"
  description = "Allow Any Outbound"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "keycloak"
  }
}
