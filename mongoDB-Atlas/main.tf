resource "mongodbatlas_cluster" "rafay-cluster-atlas" {
  project_id   = var.project_id
  name         = "cluster-atlas"
  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = var.num_shards
    regions_config {
      region_name     = "US_EAST_2"
      electable_nodes = var.electable_nodes
      priority        = var.priority
      read_only_nodes = var.read_only_nodes
    }
  }
  provider_backup_enabled      = var.provider_backup_enabled
  auto_scaling_disk_gb_enabled = var.auto_scaling_disk_gb_enabled
  mongo_db_major_version       = var.mongo_db_major_version

  # Provider Settings "block"
  provider_name               = var.provider_name
  disk_size_gb                = var.disk_size_gb
  provider_instance_size_name = var.provider_instance_size_name
}

resource "mongodbatlas_database_user" "rafay-db-user" {
  username           = var.atlas_dbuser
  password           = var.atlas_dbpassword
  auth_database_name = "admin"
  project_id         = var.project_id
  roles {
    role_name     = "readWrite"
    database_name = "admin"
  }
  depends_on = [var.project_id]
}
resource "mongodbatlas_network_container" "rafay_container1" {
  atlas_cidr_block = var.atlas_vpc_cidr
  project_id       = var.project_id
  provider_name    = var.provider_name
  region_name      = var.atlas_region
}

# tflint-ignore: terraform_unused_declarations
data "mongodbatlas_network_container" "rafay_container1" {
  container_id = mongodbatlas_network_container.rafay_container1.container_id
  project_id   = var.project_id
}

resource "mongodbatlas_network_peering" "rafay-network_peering" {
  accepter_region_name   = var.aws_region
  project_id             = var.project_id
  container_id           = mongodbatlas_network_container.rafay_container1.container_id
  provider_name          = var.provider_name
  route_table_cidr_block = var.cidr_block
  vpc_id                 = var.vpc_id
  aws_account_id         = var.aws_account_id
}

#resource "mongodbatlas_project_ip_access_list" "test" {
  #project_id = var.project_id
  #cidr_block = aws_vpc.primary.cidr_block
 # comment    = "cidr block for AWS VPC"
#}

#######################################################
##                AWS                                ##      
#######################################################

# Create IGW
data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_route_tables" "rts" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:BU"
    values = ["Rafay_Created"]
  }
}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

# Route Table
resource "aws_route" "rafay-primary-internet_access" {
  count                     = 1
  route_table_id            = tolist(data.aws_route_tables.rts.ids)[count.index]
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = data.aws_internet_gateway.default.internet_gateway_id
}

resource "aws_route" "rafay-peeraccess" {
  count                     = 1
  route_table_id            = tolist(data.aws_route_tables.rts.ids)[count.index]
  destination_cidr_block    = var.atlas_vpc_cidr
  vpc_peering_connection_id = mongodbatlas_network_peering.rafay-network_peering.connection_id
  depends_on                = [aws_vpc_peering_connection_accepter.peer]
}

# Subnet-A
resource "aws_subnet" "rafay-primary-az1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.89.23.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"
}

# Subnet-B
resource "aws_subnet" "rafay-primary-az2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.89.24.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.aws_region}b"
}

/*Security-Group
Ingress - Port 80 -- limited to instance
          Port 22 -- Open to ssh without limitations
Egress  - Open to All*/

resource "aws_security_group" "rafay-primary_default" {
  name_prefix = "default-"
  #description = "Default security group for all instances in ${var.vpc_id}"
  vpc_id      = var.vpc_id
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = mongodbatlas_network_peering.rafay-network_peering.connection_id
  auto_accept               = true
}