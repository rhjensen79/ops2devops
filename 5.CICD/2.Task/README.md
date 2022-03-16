# CI/CD

## Create Kubeconfig file, for remote access for CI/CD Workflow

- Run `sed "s/certificate-authority-data:.*/insecure-skip-tls-verify: true/g" /home/ubuntu/.kube/config > kubeconfig.yml` to allow connectivity external, without verifying the certificate.
- Open `kubeconfig.yml` and change the local ip under server to the public ip of the K8S server (Same port and protocol)

- Open ![github.com](www.github.com) -> your repository -> Settings -> Secrets -> Actions
- Add new secret with the name `KUBE_CONFIG` and paste the content from the `kubeconfig.yml` in the `value` field.
- The Variable `KUBE_CONFIG` can now be used, in the repositorys actions securely.
- Open `deployment.yml` and change all variables to your student number. Remember to also change the port.
- Open `k8s-deploy.yml`
- Talk in class about :
    - Action modules
    - Secrets / Variables
- Copy `k8s-deploy.yml` to then workflows folder by running `cp k8s-deploy.yml ../../.github/workflows` and commit and push your repo after.
- Open github.com -> Actions and see your action run.
- Check the deployment runs, and that the container from last step, is now deployed on the Kubernetes cluster.

