# ubi8-httpd
UBI 8 Apache web server

This Dockerfile defines an image for building a Red Hat Universal Base Image (UBI) 8 that runs an [Apache web server](https://httpd.apache.org/).

## Build with buildah
```bash
$ buildah bud -t rhc4tp/ubi8-httpd .
```

## Run and test with podman
```bash
$ podman run -d -p 80:80 rhc4tp/ubi8-httpd
$ curl http://localhost:80
```
