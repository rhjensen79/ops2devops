# variable_output.tf
 
# Variables to show after the deployment
#########################################
 

#output "ServerName" {
#  value = aws_instance.instance[*].tags
#}

output "student_ip" {
  value = aws_instance.instance[*].public_ip
}

output "k8s_ip" {
  value = aws_instance.k8s.public_ip
}
