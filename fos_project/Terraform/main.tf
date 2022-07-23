resource "aws_vpc" "primary_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
      Name = "primary"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[0]
  cidr_block = var.subnet_cidrs[0]
  tags = {
      Name = var.subnet_names[0]
  }
}

resource "aws_subnet" "sub2" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[1]
  cidr_block = var.subnet_cidrs[1]
  tags = {
      Name = var.subnet_names[1]
  }
}


resource "aws_subnet" "sub3" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[2]
  cidr_block = var.subnet_cidrs[2]
  tags = {
      Name = var.subnet_names[2]
  }
}


resource "aws_instance" "K8scluster" {
  ami                           = var.img_id
  associate_public_ip_address   = true
  instance_type                 = "t2.micro" 
  key_name                      = "keyname" 
  vpc_security_group_ids        = []
  subnet_id                     = aws_subnet.sub1 
}

  ingress {
    description = "Open HTTP For all"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = [ "0.0.0.0/0" ]
  }