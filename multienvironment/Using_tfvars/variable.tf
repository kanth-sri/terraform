variable "common_tags" {
    type = map
    default = {
        project = "expense"
        terraform = "true"
    }
}
variable "env" {
    type = map
  
}
variable "instance_names" {
    type = map(string)
}

variable "zone_id" {
    default = "Z02632882WFOI23E22TF"
}

variable "domain" {
  default = "srikanthadepu.online"
}
variable "sg_name" {
    type = string
  
}