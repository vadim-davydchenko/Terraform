provider "aws" {
  access_key = "AKIAVRZPLLHTXJIYI7HB"
  secret_key = "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"
  region = "us-east-1"
}

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
  vpc      = true
}


resource "aws_instance" "my_webserver" {
  ami = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  subnet_id = "subnet-05f3729f31ae3afae"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Vadim",
    l_name = "Davydchenko",
    names = ["Vasya","Kolya","John","Donald", "Katya"]
  })

tags = {
  Name = "Web Server Terraform"
  Owner = "Vadim"
}

lifecycle {
  create_before_destroy = true
}
}

resource "aws_security_group" "my_webserver" {
  name        = "WEbServer Security Group"
  description = "First SG"
  vpc_id = "vpc-0754c0fddbcfd8dd4"

  dynamic "ingress" {
for_each = ["80", "443"]
  content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
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




 