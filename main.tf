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
             nohup busybox httpd -f -p 8080 &
             EOF
  user_data__replace_on_change = true

tags = {
  name = "terraform-example"
}
}

resource "aws_security_group" "instance" {
name = "terraform-example-instance"
ingress {
from_port = 8080
to_port = 8080
protocol ="tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}


