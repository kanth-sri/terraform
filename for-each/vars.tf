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
# variable "instance_names" {
#     type = list(string)v
#     default = [ "mysql", "backend", "frontend" ]
# }
variable "instance_names" {
    type = map(string)
    default = {
     "mysql" = "t3.small"
     "frontend" = "t3.micro"
     "backend" = "t3.micro"
    }
  
}

variable "zone_id" {
    default = "Z02632882WFOI23E22TF"
}

variable "domain" {
  default = "srikanthadepu.online"
}