# Docker-Compose

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

## docker-compose.yml

- Open `docker-compose.yml` and examine the content of the file. 
- Note :
    - Internal name
    - Container name
    - Build
    - Ports
    - Volumes (data is external from the container)

- run `docker-compose up` to build and run the container.
- Note we build the container in this example, but we could just as well, pull one from a registry.
- open a browser to `http://studentip:80` and see the website, is updated with a image, and text more fitting for this task.
- Press `ctrl+c`to cancel the running container.

## Run as deamon

- run `docker-compose up -d` to run the container as a service
- run `docker ps` and see the container running.
- Note the name if the container, is nginx, and not reandom generated.
- open a browser to `http://studentip:80` and see it's still runnning as before.
- Open `index.html` and change `Student xxx` to your student number. 
- Save the file and refresh the website, and see your changes.
- Note the changes is not build into the container, but instead directly presented from the html directory.
- run `docker-compose down` to stop the container. 