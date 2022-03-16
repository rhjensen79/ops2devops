# CI/CD

## Create Kubeconfig file, for remote access for CI/CD Workflow

- Run `sed "s/certificate-authority-data:.*/insecure-skip-tls-verify: true/g" /home/ubuntu/.kube/config > kubeconfig.yml` to allow connectivity external, without verifying the certificate.

- Open ![github.com](www.github.com) -> your repository -> Settings -> Secrets -> Actions
- Add new secret with the name `KUBECONFIG` and paste the content from the `kubeconfig.yml` in the `value` field.
- The Variable `KUBECONFIG` can now be used, in the repositorys actions securely.

