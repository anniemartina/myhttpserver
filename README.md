# Welcome to TRDL
TRDL is a web service that returns the value based on the request input. This is a Proof-of-concept Project which will return the value 42 when a GET request is placed to the '/' path.
## Architecture
![image](https://github.com/anniemartina/trdl/assets/137068841/6bec2bbd-611d-46fd-8221-ea78e5c8c83d)

## Prerequisities

#### Install tools
In order to run this container you'll need docker installed on Ubuntu 22.04
```
sudo snap install docker
```
#### Login to github docker repository 
Create access token from your account and login using the following command
```
echo <access_token> | sudo docker login ghcr.io -u <user_name> --password-stdin
```

## Getting Started
Clone the repository
```
git clone git@github.com:anniemartina/trdl.git
```

### Configuration

| Command 	| Definition |
|---------------|-------------|
| `make build` 	| Build the container image |
| `make launch`	| Run the container |
| `make attach`	| Attach to the container |
| `make rm`     | Remove the container |
| `make clean` 	| Delete stopped containers |
| `make push` 	| Push the container image to repository |
| `make pull` 	| Pull the container image from repository |
| `make test` 	| Run unittest for flask application |
| `make lint`	| Run lint validation for Error on the application code |

### Useful File Locations
* [trdl.py](https://github.com/anniemartina/trdl/blob/master/trdl.py) - Flask Application
* [test_trdl.py](https://github.com/anniemartina/trdl/blob/master/test_trdl.py) - Pytest for Flask Application

### Build and test Code

1. Install python packages from requirements.txt and dev-requirements.txt
```
pip install -r requirements.txt -r dev-requirements.txt
```

2. Modify the Application and unittest and update the `TAG := 2` in Makefile

3. Build the container image and test
```
make build
make launch
```

4. To test the basic flask functionality
```
curl -v http://0.0.0.0/
```
Sample response:
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

5. Push the validated container image to the repository
```
make push
```

6. Remove the container from dev-vm for cleanup:
```
make rm
```

## Build Infrastructure and EKS Cluster using Terraform
Follow the instructions in the [README.md](https://github.com/anniemartina/terraform_eks#readme) to Build the Infrastructure and EKS Cluster using Terraform

## Install trdl container on EKS Cluster using Helm
Follow the instructions in the [README.md](https://github.com/anniemartina/terraform_eks#readme) to Install the trdl container using Helm
