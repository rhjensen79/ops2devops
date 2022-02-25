# CI/CD

## Setup Kubectl for remote access

- Run `sed "s/certificate-authority-data:.*/insecure-skip-tls-verify: true/g" /home/ubuntu/.kube/config` to allow connectivity external, without verifying the certificate.
