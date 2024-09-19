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
  ingress { //allow traffic from tcp protocol  and from 22 port and from all ip range
    from_port        = 22
    to_port          = 22
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { 
    from_port        = 80
    to_port          = 80
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { 
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp" 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = terraform.workspace
  }
}

resource "aws_instance" "expense" {

  ami =  "ami-09c813fb71547fc4f"
  instance_type = lookup(var.instances, terraform.workspace)
  //instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"  //condition to check weather its prod or dev 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = terraform.workspace
  }
}
