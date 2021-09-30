provider "aws" {
  access_key = "AKIAVRZPLLHTXJIYI7HB"
  secret_key = "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"
  region = "us-east-1"
}
resource "aws_instance" "my_webserver" {
  ami = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  subnet_id = "subnet-05f3729f31ae3afae"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
sudo serivce httpd start
chkconfig httpd on
EOF
tags = {
  Name = "Web Server Terraform"
  Owner = "Vadim"
}
}

resource "aws_security_group" "my_webserver" {
  name        = "WEbServer Security Froup"
  description = "First SG"
  vpc_id = "vpc-0754c0fddbcfd8dd4"

  ingress {
    
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  
  ingress {
    
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
    
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }
  tags = {
  Name = "Web Server Terraform"
  Owner = "Vadim"
  
}
}
 