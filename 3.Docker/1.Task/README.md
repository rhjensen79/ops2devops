# Dockerfile

## Docker Hub

- Open [https://hub.docker.com](https://hub.docker.com)
- Search for `Nginx`
- Go thru the documentation

## Dockerfile

- Open the `Dockerfile` in VSCode
- Go thru the different options
    - FROM
    - WORKDIR
    - RUN
    - COPY
    - EXPOSE
    - CMD

## Build Container

- If you don't already have a terminal, in the 3.Docker/1.Task directory, then right click the directory on the left, and selct `Open in integrated terminal`
- This opens a terminal, in the correct directory. Change directory, for each task, either by command, or by doing the above step, for each task as you progress.
- Run `docker build -t web:v1 .` 
- Watch the build finish
- When it's done, you should read `Successfully tagged web:v1`
- This means you build a container, named web:1

## Run Container

- Run `docker run -p 80:80 web:v1`
- open a browser to `http://studentip:80`
- See the website that is running :-) 
- Stop the container pressing `ctrl + c`

## Make Changes

- Edit `html/index.html` by replacing the `Student xxx` with your name.
- Build a new version of the container, by running `docker build -t web:v2 .` 
- Run the new version `docker run -p 80:80 web:v2`
- open a browser to `http://studentip:80` and see that the content has changed.
- Stop the container again

## See the different images

- run `docker ps -a` and see that you have 2 versions of the `web` container.