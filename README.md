# image-anchorectl

A simple container image for running anchorectl


Prerequisites
-----

I assume you have installed Docker and it is running.

See the [Docker website](http://www.docker.io/gettingstarted/#h_installation) for installation instructions.

Build
-----

Steps to build a Docker image:

1. Clone this repo

        git clone https://github.com/polarpoint-io/image-anchorectl.git

2. Build the image

```shell
docker build -t="anchorectl" image-anchorectl
```
mac 

```shell
docker buildx build --platform=linux/amd64  --push -t polarpoint/anchorectl:1.2.0  --push .
```

