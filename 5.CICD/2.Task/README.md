# CI/CD

## Create Kubeconfig file, for remote access for CI/CD Workflow

- Run `sed "s/certificate-authority-data:.*/insecure-skip-tls-verify: true/g" /home/ubuntu/.kube/config > kubeconfig.yml` to allow connectivity external, without verifying the certificate.
- Open `kubeconfig.yml` and change the local ip under server to the public ip of the K8S server (Same port and protocol)

- Open ![github.com](www.github.com) -> your repository -> Settings -> Secrets -> Actions
- Add new `Repository secret` with the name `KUBE_CONFIG` and paste the content from the `kubeconfig.yml` in the `value` field.
- The Variable `KUBE_CONFIG` can now be used, in the repositorys actions securely.
- Open `deployment.yml` in VScode and change all variables to your student number. Remember to also change the port.
- Also change the iamge, to your new package you created in the last Task.
- Open `k8s-deploy.yml`
- Talk in class about :
    - Action modules
    - Secrets / Variables
    - Run
- Copy `k8s-deploy.yml` to then workflows folder by running `cp k8s-deploy.yml ../../.github/workflows` and commit and push your repo after.
- Open github.com -> Actions and see your action run successfull.
- Run `kubectl get all -n studentx` to see your deployment and service beging deployed.
- Note the age of the deployments.
```
NAME                                       READY   STATUS    RESTARTS   AGE
pod/studentx-deployment-648bffc4c7-lf4dg   1/1     Running   0          24s

NAME                    TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/nginx-service   NodePort   10.152.183.128   <none>        80:30010/TCP   23s

NAME                                  READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/studentx-deployment   1/1     1            1           24s

NAME                                             DESIRED   CURRENT   READY   AGE
replicaset.apps/studentx-deployment-648bffc4c7   1         1         1       24s
```

