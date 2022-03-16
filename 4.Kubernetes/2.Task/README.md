# Kubernetes Services

# Webtop
- To access the services on the Kubernetes cluster remotely, we need a local browser in the enviroment. This is solved by deploying a Webtop.
- Run `docker-compose up -d`to start the webtop container.
- Access it from a local browser, on you laptop, by pointing it to your VM's public ip. It can be seen in the bottom left corner, in VSCode.
- Url : `http://ip:80`
- Keep you browser connected, until we need it later.

## Add Services to Deployment
- Copy the deployment.yml file you created in last task by running `cp ../1.Task/deployment.yml deployment.yml` from the `2.Task` directory
- Edit the `service.yml` file, so the `Selector: app name`matches the name in the deployment.
- Make sure to also change the nodeport, to match your student number, in the last 2 digits. 
- In this demo enviroment, we are using Nodeport, to expose the deployments. Talk about the different ways you can expose a service :
  - NodePort
  - LoadBalancer
  - Ingress


