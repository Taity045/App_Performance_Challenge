provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0aeeebd8d2ab47354"
  subnet_id     = "subnet-02bea39d8c957d3dc"
  instance_type = "t2.micro" 
  key_name      = "ec2"
  user_data = <<-EOF
              !/bin/bash
              yum update -y
              amazon-linux-extras install epel -y
              sudo yum -y install gcc make
              sudo yum groupinstall "Development Tools" -y
              sudo yum install git 

              # INSTALL PYTHON and MODULES
              sudo yum install python3 -y
              sudo yum install pip -y
              sudo yum install python3-pip python3-devel python3-setuptools -y
              sudo yum install libpq-dev python-dev -y
              sudo yum install python-devel postgresql-devel -y
              sudo yum install python-psycopg2 -y
              alias python=python3
              pip3 install psycopg2
              pip3 install configparser
              pip3 install redis
              pip3 install flask

              # INSTALL PSQL
              amazon-linux-extras install postgresql11 -y

              # INSTALL NGINX
              sudo amazon-linux-extras install nginx -y
              sudo sytemctl start nginx
              sudo systemctl enable nginx 
              EOF
    tags = {
    Name = "web-server"          
               
  }
}



resource "aws_elasticache_cluster" "redis_cache" {
  cluster_id           = "cache-aside"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
}

resource "aws_db_instance" "example" {
  identifier           = "challenge"
  allocated_storage    = 5
  engine               = "postgres"
  instance_class       = "db.t2.micro"
  name                 = "challenge"
  username             = "challenge"
  password             = "ACGChall3ng3"
  publicly_accessible  = true
}

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "3.7"
#     }
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_vpc" "challenge" {
#   cidr_block = "10.0.0.0/16"




resource "aws_security_group" "sg1" {
  name = "ec2-rds-sg"

  #Inbound HTTP from anywhere
  ingress {
    from_port = "${var.web_server_port}"
    to_port   ="${var.web_server_port}"
    protocol = "tcp"
    cidr_block = ["0.0.0.0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0"]
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0"]
  }

  
}