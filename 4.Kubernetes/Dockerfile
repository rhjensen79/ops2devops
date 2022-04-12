FROM nginx:latest
WORKDIR usr/share/nginx/html
RUN apt-get update && apt-get upgrade -y
RUN echo "test"
COPY ./html /usr/share/nginx/html
EXPOSE 80
