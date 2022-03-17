# 3. Task - Advanced Docker-Compose

## Multi Container Wordpress app.

- Open `docker-compose.yml`
- Run thru the file, and talk about the following :
    - Multiple containers
    - Env variables
    - Links between containers
    - Volumes
    - Depends on
    - restart policy

- Run `docker-compose up`
- Look at the images get pulled, and the install process runs.
- Open `http://studentip:80` and run thru the setup guide.
- See you new have a full Wordpress site, with seperate Web and DB instances.
- Press `ctrl + c` to stop the container.


## Data / Volumes

- Run `docker volume ls` and see you now have 2 volumes.
```
DRIVER    VOLUME NAME
local     3task_db_data
local     3task_wordpress_data
```
- Talk in class about : 
    - Volumes
    - Driver / Location
    - Sharing data between containers