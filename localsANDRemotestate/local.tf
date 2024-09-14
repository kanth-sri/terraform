locals {
  domain = "srikanthadepu.online"
  instance_type_info = var.environment == "prod" ? "t3.small" : "t3.micro" // we can keep expressions in locals 
}