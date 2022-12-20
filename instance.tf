resource "aws_instance" "server" {
  ami                         = "ami-0574da719dca65348"
  instance_type               = "t2.micro"
  key_name                    = "stack-monitoramento"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security_group_ec2.id]
  user_data                   = file("userdata_server.sh")

  tags = {
    name = "server"
  }

  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
}


resource "aws_instance" "client" {
  count = 3
  ami                         = "ami-0574da719dca65348"
  instance_type               = "t2.micro"
  key_name                    = "stack-monitoramento"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security_group_ec2.id]
  user_data                   = file("userdata_client.sh")

  tags = {
    name = "client-${count.index}"
  }
}