# Setup Keycloak For Kubernetes Authentication

* Create `tfvars` file.

```
cp terraform.tfvars.example terraform.tfvars
```

* Update the `tfvars` file so the settings are correct. The password must follow the following policies:
    * at least 12 digits
    * 2 upper
    * 2 lower
    * 2 number
    * 2 special character

* Provision the AWS hardware.

```
./01-tfa
```

* Create the sub-domain.

```
./02-create-vanity-url
```

* Install Keycloak on the server.

```
./03-run-playbook
```

* Configure KeyCloak with a realm, admin user and realm users.

```
./04-configure-keycloak
```

## Visit KeyCloak Page

If you need to visit the KeyCloak home page, use the provided script.

```
./cmd-open-keycloak-page
```

## SSH

If you need to SSH to the KeyCloak server, use the provided script.

```
./cmd-ssh-to-keycloak
```

## Destroy KeyCloak

If you need to de-provision the KeyCloak server, use the provided script.

```
./cmd-tfd
```
