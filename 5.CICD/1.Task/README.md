# CI/CD

## Setup Kubectl for remote access

## Create Kubeconfig file, for remote access for CI/CD Workflow

- Run `sed "s/certificate-authority-data:.*/insecure-skip-tls-verify: true/g" /home/ubuntu/.kube/config > kubeconfig.yml` to allow connectivity external, without verifying the certificate.

- 
