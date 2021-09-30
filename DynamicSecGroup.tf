provider "aws" {
  access_key = "AKIAVRZPLLHTXJIYI7HB"
  secret_key = "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"
  region = "us-east-1"
}

resource "aws_security_group" "my_webserver" {
  name        = "Dynamic Security Group"
  description = "First SG"
  vpc_id = "vpc-0754c0fddbcfd8dd4"

dynamic "ingress" {
for_each = ["80", "443","8080", "1541", "9092"]
  content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

ingress {
      from_port        = 22
      to_port          = 22
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
 