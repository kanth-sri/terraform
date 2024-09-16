resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0a2339349dedaa1b5"
  
  egress { //allow traffic from every protocol and from every port.
    from_port        = 0
    to_port          = 0
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks

    }
  }


  tags = {
    Name = "allow_tcp"
  }
}

resource "aws_instance" "expense" {

  ami =  "ami-09c813fb71547fc4f"
  for_each = var.instance_names
  instance_type = each.value
  //instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"  //condition to check weather its prod or dev 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = merge(var.common_tags,
   {Name = each.key}
   )
}
