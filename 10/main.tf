provider "aws"{
    access_key = ""
    secret_key = ""
    region = "ap-southeast-2"
}

data "aws_ami" "ubuntu"{
   owners = ["099720109477"]
   most_recent = true
   filter {
       name = "name"
       values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
   }
}

data "aws_ami" "amazon"{
   owners = ["amazon"]
   most_recent = true
   filter {
       name = "name"
       values = ["amzn2-ami-hvm-*-x86_64-gp2"]
   }
}

data "aws_ami" "windows"{
   owners = ["amazon"]
   most_recent = true
   filter {
       name = "name"
       values = ["Windows_Server-2019-English-Full-Base-*"]
   }
}

output "latest_ubuntu_ami_id" {
    value = data.aws_ami.ubuntu.id
}

output "latest_ubuntu_ami_name" {
    value = data.aws_ami.ubuntu.name
}

output "latest_amazon_ami_id" {
    value = data.aws_ami.amazon.id
}


output "latest_amazon_ami_name" {
    value = data.aws_ami.amazon.name
}


output "latest_windows_ami_id" {
    value = data.aws_ami.windows.id
}


output "latest_windows_ami_name" {
    value = data.aws_ami.windows.name
}