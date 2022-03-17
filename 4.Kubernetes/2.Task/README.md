# 2. Task - Deployment with service

## Add Services to Deployment

- Copy the deployment.yml file you created in last task by running `cp ../1.Task/deployment.yml deployment.yml` from the `2.Task` directory
- Edit the `service.yml` file, so the `Selector: app name`matches the name in the deployment.
- Correct `studentx` to the correct student number.
- Change the nodeport, to match your student number, in the last 2 digits. 
- In this demo enviroment, we are using Nodeport, to expose the deployments. Talk about the different ways you can expose a service :
  - NodePort
  - LoadBalancer
  - Ingress

## Deploy app with service

- Run `kubectl apply -f .` to deploy all .yml files in the directory
- You should see each file being created
```
deployment.apps/student1-deployment created
service/nginx-service created
```
- Run `kubectl get all -n studentx` to see your deployment and services has been deployed.
```
NAME                                      READY   STATUS    RESTARTS   AGE
pod/student1-deployment-9888cf49d-w855n   1/1     Running   0          77s

NAME                    TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/nginx-service   NodePort   10.152.183.251   <none>        80:30010/TCP   77s

NAME                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/student1-deployment   1/1     1            1           77s

NAME                                            DESIRED   CURRENT   READY   AGE
replicaset.apps/student1-deployment-9888cf49d   1         1         1       77s
```
- Open a browser to the public ip of the K8S server, with the port number you specified earlier `http://K8SPublicIp:30010` and see your deployment is working, and is exposed to the outside world.

- Cleanup by running `kubectl delete -f .`