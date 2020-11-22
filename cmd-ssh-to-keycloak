#!/bin/bash

IP_ADDRESS=$(terraform output keycloak_public_ip)
PKI_PRIVATE_KEY=$(terraform output pki_private_key)
SSH_USER=$(terraform output ssh_user)

ssh -i "/data/home/medined/Downloads/pem/davidm.xyz.pem" $SSH_USER@$IP_ADDRESS
