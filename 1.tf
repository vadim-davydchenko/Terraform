provider "aws" {
  access_key = "AKIAVRZPLLHTXJIYI7HB"
  secret_key = "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"
  region = "us-east-1"
}

resource "aws_instance" "my_Ubuntu" {
  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  subnet_id = "subnet-05f3729f31ae3afae"
  tags = {
    Name = "My Ubuntu Server"
    Owner = "Vadim"
    Project = "Terraform Lessons"
  }
}

resource "aws_instance" "my_Amazon" {
  ami = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  subnet_id = "subnet-05f3729f31ae3afae"
  tags = {
    Name = "My Amazon Server"
    Owner = "Vadim"
    Project = "Terraform Lessons"
  }
}