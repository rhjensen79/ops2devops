# variable_output.tf
 
# Variables to show after the deployment
#########################################
 

#output "ServerName" {
#  value = aws_instance.instance[*].tags
#}

output "public_ip" {
  value = aws_instance.instance[*].public_ip
}


