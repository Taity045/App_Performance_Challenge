provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0747bdcabd34c712a"
  subnet_id     = "subnet-0d19fafbe38611c2d"
  instance_type = "t2.micro"
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

# provider "aws" {
#   alias  = "us-east-1"
#   region = "us-east-1"
# }

# provider "aws" {
#   alias  = "us-west-2"
#   region = "us-west-2"
# }


# resource "aws_sns_topic" "topic-us-east" {
#   provider = aws.us-east-1
#   name     = "topic-us-east"
# }

# resource "aws_sns_topic" "topic-us-west" {
#   provider = aws.us-west-2
#   name     = "topic-us-west"
# }