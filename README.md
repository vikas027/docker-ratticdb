# Docker Container for RatticDB v1.3.1
The docker container is based on Debian Wheezy. [RatticDB](http://rattic.org) v1.3.1 has been installed and configured to run properly in the container.

More details are available on [Docker Hub Registry - RatticDB](https://hub.docker.com/r/vikas027/ratticdb/).

### Docker Installation
Install [Docker](https://docs.docker.com/installation/) on your favourite distro and run the container

### Run Container
Run the below commands to run the container
```bash
docker pull vikas027/ratticdb
docker run --name <any_name> -d -p <host_http_port>:80
```

### How to Login
```bash
URL: http://IP
Username: admin
Password: rattic (Make sure you change it)
```
