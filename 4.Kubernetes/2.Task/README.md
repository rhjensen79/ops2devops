# Kubernetes Services

# Webtop
- To access the services on the Kubernetes cluster remotely, we need a local browser in the enviroment. This is solved by deploying a Webtop.
- Run `docker-compose up -d`to start the webtop container.
- Access it from a local browser, on you laptop, by pointing it to your VM's public ip. It can be seen in the bottom left corner, in VSCode.
- Url : `http://ip:80`
- Keep you browser connected, until we need it later.

## Add Services to Deployment
- Copy the deployment.yml file you created in last task by running `cp ../1.Task/deployment.yml deployment.yml` from the `2.Task` directory
- Add the following to the botton of your `deployment.yaml` file. 
```
---
apiVersion: v1
kind: Service
metadata:
  name: studentx-deployment
spec:
  selector:
    app: studentx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 90xx
```
