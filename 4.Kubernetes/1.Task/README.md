# Kubernetes

## Setup Kubeconfig on Student VM

- Run `scp ubuntu@K8S_Private_Ipadress:/home/ubuntu/.kube/config /home/ubuntu/.kube/config`
- Accept certificate
- Type password `VMware1!`
- Check the config file `cat /home/ubuntu/.kube/config`

## Check connection

- Run `kubectl get nodes` to see you can connect and that the Kubernetes nodes are active

## Create Namespace
- Run `kubectl create ns studentx` where x is replaced with your student number (See cli if in doubt)

## Deployment.yml

- Open `deployment.yml` file
- Go thru the file
- Change all places in the file from `studentx`to your student number.
- Open your repository in `github.com` and click on `ops2devops` under `Packages`in the bottom right.
- copy the url after `docker pull`
- Add that url to the image key in the `deployment.yml`file
- This is the url for your package in your Github registry (Github's answer to Docker Hub)
- Save the file
- Run `kubectl apply -f deployment.yml -n studentx`
- This deploys the application
- Verify the application is deployed by running `kubectl get all -n studentx`
- Delete the application by running `kubectl delete -f deployment.yml -n studentx`

## Enhance deployment.yml

- Add a line to `deployment.yml` under `metadata`(remember indentation) with `namespace: studentx`
- Run `kubectl apply -f deployment.yml``
- See the deployment happens in the namespace you just specified, by running `kubectl get all -n studentx`
- Delete the deployment again by running `kubectl delete -f deployment.yml``


