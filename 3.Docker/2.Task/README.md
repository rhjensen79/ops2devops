# Docker-Compose

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

## docker-compose.yml

- Open `docker-compose.yml` and examine the content of the file. 
- run `docker-compose up`to build and run the container.
- open a browser to `http://studentip:80` and see the website.
- Press `ctrl+c`to cancel the running container.
- Make changes to the `html/index.html` file.
- run `docker-compose up -d` to run the container as a service
- run `docker ps` and see the container running.
- open a browser to `http://studentip:80` and see the new changes to the website.
- run `docker-compose down` to stop the container. 