output "ipv4_public" {
    value = aws_instance.terraform.public_ip
    sensitive = false
    description = "Its a public ipv4 address"
  
}