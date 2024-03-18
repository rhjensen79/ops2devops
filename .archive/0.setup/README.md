# 0. Setup

Terraform job, that deploys x student VM's in EC2, and 1 ECH VM, installed with [Microk8s](https://microk8s.io) for Kubernetes target.

Requirements :

- An AWS account
- [AWS Cli](https://aws.amazon.com/cli/) to be setup and configured
- There is a limit of 25 VM's. This can be increased, but would require changing the Terraform script.
  