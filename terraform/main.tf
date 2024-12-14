# AWS provider
provider "aws" {

  region  = var.region

}

# VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = {
      Name="My-VPC"
  }
}
# public subnet
resource "aws_subnet" "pubsub" {
  vpc_id     = "${aws_vpc.main.vpc_id}"
  cidr_block =  var.cidr_pubsub

  tags = {
    Name = "pub-sub"
  }
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
}

# EC2 
resource "aws_instance" "my-ec2" {
  
  ami = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  availability_zone = var.availability_zone
  subnet_id     = "${aws_subnet.pubsub.id}"
  key_name = "${aws_key_pair.deployer.id}"
   root_block_device {
      volume_size           = "20"
      volume_type           = "gp2"
      delete_on_termination = true
   }
  tags = {
    Name = "My-EC2"
  }


}


#EBS Volume and Attachment

resource "aws_ebs_volume" "my_ebs" {
  availability_zone = var.availability_zone
  size              = 100
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.my_ebs.id}"
  instance_id = "${aws_instance.my-ec2.id}""
}