#Welcome to MY HTTP Server
TRDL is a web service that returns the value based on the request input. 

### Prerequisities

In order to run this container you'll need docker installed.

```
sudo snap install docker
```

Create access token from your account and login using the following command
```
echo <access_token> | sudo docker login ghcr.io -u <user_name> --password-stdin
```

## Getting Started
Clone the repository
```
git clone git@github.com:anniemartina/myhttpserver.git
```

### Usage

####Commands and definitions to build and test the code:

| Command 	| Definition |
-----------------------------
| make build 	| Build the container image |
| make launch	| Run the container |
| make attach 	| Attach to the container |
| make rm       | Remove the container |
| make clean 	| Delete stopped containers |
| make push 	| Push the container image to repository |
| make pull 	| Pull the container image from repository |
| make test 	| Run unittest for flask application |
| make lint	| Run lint validation for Error on the application code |

### Build and test Code

#### Prerequisites to setup development environment

Install python packages from requirements.txt and dev-requirements.txt
```
pip install -r requirements.txt -r dev-requirements.txt
```
#### Files to modify for code and test improvements

* `trdl.py` - Flask Application
* `test_trdl.py` - Pytest for Flask Application

#### Update the `TAG` in Makefile
```
TAG := 2
```
#### Build the container image and test
* To build container image:
```
make build
make launch
```
* To test the basic flask functionality
```
curl -v http://0.0.0.0/
```
* Sample response:
```
*   Trying 0.0.0.0:80...
* Connected to 0.0.0.0 (127.0.0.1) port 80 (#0)
> GET / HTTP/1.1
> Host: 0.0.0.0
> User-Agent: curl/7.81.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Server: gunicorn
< Date: Mon, 14 Aug 2023 16:31:19 GMT
< Connection: close
< Content-Type: text/html; charset=utf-8
< Content-Length: 2
<
* Closing connection 0
```
* Push the validated container image to the repository
```
make push
```
* Remove the container for cleanup:
```
make rm
```
