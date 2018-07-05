# keycloak-playground

experiments with keycloak

## Installation

* uncompress the software

```
curl -O -L https://downloads.jboss.org/keycloak/4.1.0.Final/keycloak-4.1.0.Final.tar.gz
tar xvfz keycloak-4.1.0.Final.tar.gz
cd keycloak-4.1.0.Final\bin
```

* start the server

Select a non-standard port (ie. not 8080) to avoid future conflicts
with other web applications.

```
./standalone.sh -Djboss.socket.binding.port-offset=9876
```

* create the admin user

Visit http://localhost:8080/auth. Create an `admin` user with a password
of `admin`.

* login to web console

Visit http://localhost:8080/auth/admin/.

* add realm

** Mouse over the Master at the top left of the page. Then click
`Add realm`.
** enter `frog` as the name.
** click Create
** note that the frog realm is selected instead of Master.

* add user

** Click Manage > Users in left-hand section of the page.
** Click `Add user` button.
** Enter `prince` as the username.
** Click `Save` button.
** Click the `Credentials` tab.
** Set the password to `password`.
** Click `Reset Password` button.

* logout

** Click on `Admin` in top-right.
** Select `Sign Out`.

* login as frog user

** Visit http://localhost:8080/auth/realms/frog/account
** use the frog/password credentials to login.
** enter password as your new password.
** enter an email, first name, and last name for the prince user.
** Click `Save`.
