# Dockerfile

## Docker Hub

- Open [https://hub.docker.com](https://hub.docker.com)
- Search for `Nginx`
- Go thru the documentation

## Dockerfile

- Open the `Dockerfile`in VSCode
- Go thru the different options
    - FROM
    - WORKDIR
    - RUN
    - COPY
    - EXPOSE
    - CMD

## Build Container

- Run `docker build -t web:v1 .` 
- Watch the build finish

## Run Container

- Run `docker run -p 80:80 test:v1`
- open a browser to `http://studentip:80`

## Make Changes

- Edit `html/index.html`
- Build a new version of the container, by running `docker build -t web:v2 .` 
- Run the new version `docker run -p 80:80 test:v1`
- open a browser to `http://studentip:80` and see that the content has changed.