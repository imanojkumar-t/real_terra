provider "aws" {
  region = "as-east-2"
}

resource "aws_instance" "example" {
  ami = ""
  instance_type: ""
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



