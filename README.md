# Simple Restful Login API
The API was developed as a Django Application using the DJANGO REST Framework. The chosen authentication method was Json Web Token (JWT). JWT allows simple, safe and fast authentication using HTTP/s protocol. The token is retrieved when the user is successfully logged into the system. The token will be used to sign all the API calls performed from the client-side.

The implemented login Restful API exposes two endpoints:

	- api/login: used to retrieve the token.
	- api/register: used to create a new user providing the required fields as payload

## Installation
```console
foo@bar:~$ docker-compose up
```