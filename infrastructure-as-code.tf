# When a profile is specified, tf will try to use
# ~/.aws/credentials.

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  version = "~> 2.66"
}

resource "aws_key_pair" "keycloak" {
  public_key = file(var.pki_public_key)
}

resource "aws_instance" "keycloak" {
  ami           = var.ami
  associate_public_ip_address = "true"
  instance_type = var.instance_type
  key_name      = aws_key_pair.keycloak.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_any_outbound.id,
    aws_security_group.allow_keycloak.id
  ]
  tags = {
    Name = "keycloak"
  }
}

resource "aws_eip" "keycloak" {
  instance = aws_instance.keycloak.id
  vpc      = true
  tags = {
    Name = "keycloak"
  }
  connection {
    type        = "ssh"
    user        = var.ssh_user
    private_key = file(var.pki_private_key)
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y python3"
    ]
  }
  #
  # I am not using a local-exec because if it is fails, the outputs
  # are not created.
}

#
# Output variables should use underscores not dashes. This is done because
# ansible variables can not use dashes.
#

output "keycloak_admin_password" {
  sensitive   = true
  value = var.keycloak_admin_password
}
output "keycloak_admin_username" {
  value = var.keycloak_admin_username
}
output "keycloak_public_ip" {
  value = aws_eip.keycloak.public_ip
}
output "pki_private_key" {
  value = var.pki_private_key
}
output "ssh_user" {
  value = var.ssh_user
}
