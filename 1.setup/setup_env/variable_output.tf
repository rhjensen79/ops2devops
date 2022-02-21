# variable_output.tf
 
# Variables to show after the deployment
#########################################
 
output "public_ip" {
  value = aws_instance.instance.public_ip
}