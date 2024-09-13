variable "vp_id" {
    type = string
    default = "vpc-0a2339349dedaa1b5"
    description = "default vpc id "
  
}
variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "This is an ami id for RHEL "
  
}
variable "common_tags" {
    type = map
    default = {
        project = "expense"
        env = "dev"
    }
}

variable "environment" {
    default = "dev"
  
}
variable "instance_names" {
    type = list(string)
    default = [ "mysql", "backend", "frontend" ]
}