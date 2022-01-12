resource "aws_neptune_cluster" "rafay-cluster" {
  cluster_identifier                  = "${var.neptune_cluster_name}-identifier"
  engine                              = var.neptune_engine
  availability_zones                  = var.availability_zones
  backup_retention_period             = var.backup_retention_period
  preferred_backup_window             = var.preferred_backup_window
  skip_final_snapshot                 = var.neptune_skip_final_snapshot
  iam_database_authentication_enabled = var.neptune_iam_database_authentication_enabled
  apply_immediately                   = var.neptune_apply_immediately
  vpc_security_group_ids              = [ "${aws_security_group.rafay-neptune_sg.id}" ]
  neptune_subnet_group_name           = aws_neptune_subnet_group.rafay-sb.name
  final_snapshot_identifier           = "${var.neptune_cluster_name}-snapshot"
}

resource "aws_neptune_cluster_instance" "cluster_instance" {
  count              = "${var.neptune_count}"
  identifier          = var.neptune_cluster_name
  cluster_identifier  = aws_neptune_cluster.rafay-cluster.id
  instance_class      = var.neptune_instance_class
  engine              = var.neptune_engine
  publicly_accessible = var.neptune_publicly_accessible
}

resource "aws_subnet" "rafay-subnet-neptune1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.89.25.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"
}

# Subnet-B
resource "aws_subnet" "rafay-subnet-neptune2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.89.26.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.aws_region}b"
}

resource "aws_neptune_subnet_group" "rafay-sb" {
  name       = "${var.neptune_cluster_name}-neptune-subnet-group"
  subnet_ids = [aws_subnet.rafay-subnet-neptune1.id , aws_subnet.rafay-subnet-neptune2.id]
}

####Security Group to allow neptune
resource "aws_security_group" "rafay-neptune_sg" {
  name        = "${var.neptune_sg_name}"
  description = "Allow traffic for ecs"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8192
    to_port     = 8192
    protocol    = "tcp"
    self = true
    #security_groups = [ "${aws_security_group.rafay-neptune_sg.id}" ]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}