resource "aws_key_pair" "dev" {
  key_name   = "${var.environment}-key"
  public_key = var.public_key
}

data "template_file" "init" {
  template = file("${path.module}/script-init.sh.tpl")
}

resource "aws_instance" "instance" {
  ami                         = var.ami_name
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.dev.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  tags = {
    Name = var.environment
  }

  user_data = data.template_file.init.rendered

}