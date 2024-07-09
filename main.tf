provider "aws" {
  region = "us-east-2"
}


resource "aws_rds_cluster" "aurora_cluster_gestao_usuario" {
  cluster_identifier      = "my-aurora-cluster"
  engine                  = "aurora-postgresql"
  engine_version          = "11.12"
  master_username         = "admin"
  master_password         = "fiap"
  database_name           = "gestao-usuario-db"
  skip_final_snapshot     = true 
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count                   = 2 
  cluster_identifier      = aws_rds_cluster.aurora_cluster_gestao_usuario.id
  instance_class          = "db.t3.micro" 
  engine                  = "aurora-postgresql"
}