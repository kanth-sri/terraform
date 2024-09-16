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
variable "ingress_rules" {
  default = [{
    from_port        = 80
    to_port          = 80
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"]
  },
  {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"]
  },
  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ]
}
