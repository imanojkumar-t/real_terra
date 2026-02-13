provider "aws" {
  region = "as-east-2"
}

resource "aws_instance" "example" {
  ami = ""
  instance_type: ""
  vpc_security_group_ids = [aws_security_group.instance.id]
  userdata = <<-EOF
             #!/bin/bash
             echo "Hello, World" > index.xhtml
             nohup busybox httpd -f -p ${var.server_port} &
             EOF
  user_data__replace_on_change = true

tags = {
  name = "terraform-example"
}
}

resource "aws_security_group" "instance" {
name = "terraform-example-instance"
ingress {
from_port = var.server_port
to_port = var.server_port
protocol ="tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}

variable "server_port" {
  description = "the port the server will use for http requests"
  type = number 
  default = 8080
}

output "public_ip" {
  value = aws_instance.example.public_ip
  description = "the public ip adress of the web server"
}
