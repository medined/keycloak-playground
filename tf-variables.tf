#
# Some variables are not used directly by Terraform but by scripts. All
# variables are defined here so they are defined in one place.
#


variable "ami" {}
variable "aws_profile" {}
variable "aws_region" {}
variable "instance_type" {}
variable "pki_private_key" {}
variable "pki_public_key" {}
variable "ssh_cidr_block" {}
variable "ssh_user" {}
variable "subnet_id" {}
variable "vpc_id" {}

#
# KEYCLOAK SECTION
#

#
# I'd be leery of using a dollar sign
# in the password for fears of breaking some
# bash script.
#

#
# The base_url should point to the load balancer of the
# kubernetes cluster. Since the cluster may not be
# created when keycloak is provisioned, use a domain
# name like https://flooper.davidm.xyz.
#

variable "keycloak_admin_username" {}
variable "keycloak_admin_password" {}
variable "keycloak_realm" {}
variable "keycloak_realm_admin_username" {}
variable "keycloak_realm_admin_password" {}
variable "keycloak_realm_developer_username" {}
variable "keycloak_realm_developer_password" {}
variable "keycloak_realm_visitor_username" {}
variable "keycloak_realm_visitor_password" {}
variable "keycloak_client" {}
variable "keycloak_client_base_url" {}
