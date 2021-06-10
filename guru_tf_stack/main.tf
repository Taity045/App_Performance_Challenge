provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0aeeebd8d2ab47354"
  subnet_id     = "subnet-09ea1673353bea787"
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