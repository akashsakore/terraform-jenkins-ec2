data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"

    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_instance" "web" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}
