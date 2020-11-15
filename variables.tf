variable "ami" {}
variable "aws_profile" {}
variable "aws_region" {}
variable "instance_type" {}
#
# I'd be leery of using a dollar sign
# in the password for fears of breaking some
# bash script.
#
variable "keycloak_admin_username" {}
variable "keycloak_admin_password" {}
variable "pki_private_key" {}
variable "pki_public_key" {}
variable "ssh_cidr_block" {}
variable "ssh_user" {}
variable "subnet_id" {}
variable "vpc_id" {}
