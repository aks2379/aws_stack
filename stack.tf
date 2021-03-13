resource "aws_key_pair" "stack_key" {
  key_name   = "stack_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "Main_server" {
  ami           = "ami-07a0844029df33d7d"
  instance_type = "t2.micro"

  tags = {
    Name = "Main_server"
  }
}

resource "aws_instance" "Web_server" {
  ami           = "ami-07a0844029df33d7d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.stack_key.key_name

  tags = {
    Name = "Web_server"
  }

  provisioner "file" {
    source      = "installnginx.sh"
    destination = "/tmp/installnginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installnginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/installnginx.sh",
      "sudo /tmp/installnginx.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}
