
data "template_file" "neo4j-start" {
  template = "${file("neo4j-server-setup.sh")}"  
}

resource "aws_instance" "web" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t3.small"
  key_name = "ritik2nd"
  availability_zone = "us-east-2a"

  vpc_security_group_ids = [aws_security_group.fanzly-neo4j.id]
  tags = {
    Name = "fanzly-neo4j-server"
  }
  user_data = data.template_file.neo4j-server.rendered
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-2a"
  size              = 32
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}