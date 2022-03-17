# 1. Task - Simple Deployment

## Setup Kubeconfig on Student VM

- Run `scp ubuntu@10.0.1.9:/home/ubuntu/.kube/config /home/ubuntu/.kube/config`
- Type `yes` to Accept certificate
- Type password `VMware1!`
- Check the config file `cat /home/ubuntu/.kube/config` exist, and talk about it in class.
    - Certificate
    - server
    - context
    - users

## Kubectl
- Talk in class about Kubectl:
    - CLI/API
    - Yaml files vs commands

## Check connection

- Run `kubectl get nodes` to see you can connect and that the Kubernetes nodes are active
- The result should be something like this :
```
NAME   STATUS   ROLES    AGE    VERSION
k8s    Ready    <none>   6d1h   v1.23.4-2+98fc2022f3ad3e
```
- This shows the different nodes of the Kubernetes Cluster, State, Role, Age and version.
- In this workshop, we are working with a single node Kubernetes cluster, but in the real world, there would probably be 3 masters, and a large number of workers. 
- The commands we are using, are the same. We just don't have the same failover capabilities and scale.

## Create Namespace
- Run `kubectl create ns studentx` where x is replaced with your student number (See cli if in doubt)
- Run `kubectl get ns` and see that your namespace has been created
- Talk in class, about the concept of a Kubernetes namespace

## Deployment.yml

- Open `deployment.yml` file
- Go thru the file and talk in class about :
    - apiVersion
    - Kind
    - Containers
    - Limits

## Github Packages

- We are using Github's version of docker Hub. 
- To make sure, we don't have to struggle with autentification in this lab, open your forked repository on github.com.
- Click `Packages`
- If the package has a `private` label next to it, follo the following steps. If not, you can skip ahead.
    - Click on the package name `4-k8s-1`
    - Select `Package settings` on the right
    - Click `Change visibility` in the `Danger Zone` area in the bottom.
    - Change to `public` and type in the text that you prompted for.

## Deploy first Kubernetes app

- Change all places in `deployment.yml` from `studentx` to your student number.
- Open your repository in `github.com` and click on `ops2devops/4-k8s-1` under `Packages`in the bottom right.
- !!! If you can't see any packages, then it's probably because you forgot to commit and push your git changes, after each task. Get help from the teacher, or use this url for now `ghcr.io/tanzudk/ops2devops/4-k8s-1:master`
- copy the entire url after `docker pull`
- Replace the url after image, with your own in the `deployment.yml`file
- This is the url for your package in your Github registry.
- Save the file
- Run `kubectl apply -f deployment.yml -n studentx`
- This deploys the application in your own namespace
- Verify the application is deployed by running `kubectl get all -n studentx`
- Note we did not expose the app, to the outside work. That is for next Task.
- Delete the application by running `kubectl delete -f deployment.yml -n studentx`

## Enhance deployment.yml

- Add a line to `deployment.yml` under `metadata`(remember indentation) with `namespace: studentx`
- Run `kubectl apply -f deployment.yml``
- See the deployment now happens in the namespace you just specified, by running `kubectl get all -n studentx`, without you typing it in each command.
- Delete the deployment again by running `kubectl delete -f deployment.yml``

## See all deployments / pods

- If you want to see all deployments across namespaces, then run `kubectl get deployments -A`
- You can do the same with pods `kubectl get pods -A`
- Or just type `kubectl get all -A` if you want to see (almost) all types of things running.