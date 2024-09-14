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

variable "zone_id" {
    default = "Z02632882WFOI23E22TF"
}

variable "domain" {
  default = "srikanthadepu.online"
}