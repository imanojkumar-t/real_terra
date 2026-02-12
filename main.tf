provider "aws" {
  region = "as-east-2"
}

resource "aws_instance" "example" {
  ami = ""
  instance_type: ""

tags = {
  name = "terraform-example"
}
}

