variable "region" {
}
variable "aws_access_key" {}

variable "aws_secret_key" {}

#-----------------------------------------------------------------------------------------#
# vpc Specific Variables
#-----------------------------------------------------------------------------------------#
variable "production_vpc_id" {
}
variable "create_production_vpc"{
}
variable "az-private-subnet-mapping" {
  type        = list(map(string))
  description = "Private subnets mapping"
  # default     = []
}
variable "elasticsearch-az-private-subnet-mapping" {
  type = list(map(string))
}
variable "redshift-az-public-subnet-mapping" {
  type = list(map(string))
}
variable "mariadB-az-private-subnet-mapping" {
  type = list(map(string))
}
#--------------------------#
#CGMS Security Group
#--------------------------#
variable "cgms_sg_name" {
  description = "Security Group name"
  # default     = "Terraform-created-cgms-sg"
}

variable "cgms_sg_description" {
  description = "Security Group description"
  default     = "Terraform-created-group"
}

#----------------------------------#
#CGMS Security Group Ingress rule  #
#----------------------------------#

variable "sg_cgms_inbound_ports" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "sg_cgms_protocol" {
  description = "TCP | UDP"
  # default     = "tcp"
}

variable "cgms_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_cgms_description" {
  description = "rule descriptions"
  default     = ""
}

#--------------------------------------#
#CGMS Security Group Ingress rule NLB  #
#--------------------------------------#

variable "sg_cgms_inbound_ports_nlb" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "sg_cgms_protocol_nlb" {
  description = "TCP | UDP"
  # default     = "-1"
}

variable "cgms_ingress_cidr_nlb" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_cgms_description_nlb" {
  description = "rule descriptions"
  default     = ""
}

#--------------------------------------#
#Security rule for APISRV rule
#--------------------------------------#
variable "sg_cgms_apisrv_inbound_ports_nlb" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "cgms_apisrv_ingress_cidr_nlb" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_cgms_apisrv_description_nlb" {
  description = "rule descriptions"
  default     = ""
}

#-------------------------------------#
#CGMS Security Group UDP Ingress rule
#-------------------------------------#
variable "sg_cgms_udp_inbound_ports" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "sg_cgms_udp_protocol" {
  description = "TCP | UDP"
  # default     = "udp"
}

variable "cgms_udp_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_cgms_udp_description" {
  description = "rule descriptions"
  default     = ""
}

#--------------------------#
#CGMS LB Security Group
#--------------------------#
variable "cgms_lb_sg_name" {
  description = "Security Group name"
  # default     = "Terraform-created-cgms-lb-sg"
}

variable "cgms_lb_sg_description" {
  description = "Security Group description"
  default     = "Terraform-created-group"
}

#---------------------------------------#
#CGMS Security Group TCP Ingress rule   #
#---------------------------------------#

# variable "sg_cgms_lb_tcp_inbound_ports" {
#   description = "inbound ports to allow"
#   # default     = 0
# }

# variable "sg_cgms_lb_tcp_protocol" {
#   description = "TCP | UDP"
#   # default     = "tcp"
# }

# variable "cgms_lb_tcp_ingress_cidr" {
#   description = "allowed subnets"
#   type        = list
#   # default     = ["192.168.0.0/16"]
# }

# variable "sg_cgms_lb_tcp_description" {
#   description = "rule descriptions"
#   # default     = ""
# }

#-----------------------------------------------#
#CGMS Security Group TCP Ingress rule internal  #
#-----------------------------------------------#

# variable "sg_cgms_lb_tcp_internal_inbound_ports" {
#   description = "inbound ports to allow"
#   # default     = 0
# }

# variable "cgms_lb_tcp_ingress_cidr_internal" {
#   description = "allowed subnets"
#   type        = list
#   # default     = ["192.168.0.0/16"]
# }

# variable "sg_cgms_lb_tcp_description_internal" {
#   description = "rule descriptions"
#   # default     = ""
# }

#--------------------------------------------------#
#CGMS LB Security Group TCP monitors Ingress rule  #
#--------------------------------------------------#

# variable "sg_cgmsmon_inbound_ports" {
#   description = "inbound ports to allow"
#   # default     = 0
# }

# variable "sg_cgmsmon_protocol" {
#   description = "TCP | UDP"
#   # default     = "tcp"
# }

# variable "cgmsmon_ingress_cidr" {
#   description = "allowed subnets"
#   type        = list
#   # default     = ["192.168.0.0/16"]
# }

# variable "sg_cgmsmon_lb_tcp_description_internal" {
#   description = "rule descriptions"
#   # default     = ""
# }


#--------------------------------------#
#CGMS Security Group UDP Ingress rule  #
#---------------------------------------#

# variable "sg_cgms_lb_udp_inbound_ports" {
#   description = "inbound ports to allow"
#   # default     = 0
# }

# variable "sg_cgms_lb_udp_protocol" {
#   description = "TCP | UDP"
#   # default     = "udp"
# }

# variable "cgms_lb_udp_ingress_cidr" {
#   description = "allowed subnets"
#   type        = list
#   # default     = ["192.168.0.0/16"]
# }

# variable "sg_cgms_lb_udp_description" {
#   description = "rule descriptions"
#   # default     = ""
# }

#--------------------------#
#CASS Security Group
#--------------------------#
# variable "cass_sg_name" {
#   description = "Security Group name"
#   # default     = "Terraform-created-cass-sg"
# }

# variable "cass_sg_description" {
#   description = "Security Group description"
#   # default     = "Terraform-created-group"
# }

#----------------------------------#
#CASS Security Group Ingress rule  #
#----------------------------------#

# variable "sg_cass_inbound_ports" {
#   description = "inbound ports to allow"
#   # default     = 0
# }

# variable "sg_cass_protocol" {
#   description = "TCP | UDP"
#   # default     = "tcp"
# }

# variable "cass_ingress_cidr" {
#   description = "allowed subnets"
#   type        = list
#   # default     = ["192.168.0.0/16"]
# }

# variable "sg_cass_description" {
#   description = "rule descriptions"
#   # default     = ""
# }

#--------------------------------------#
#CASS Security Group Ingress rule NLB  #
#--------------------------------------#

# variable "sg_cass_inbound_ports_nlb" {
#   description = "inbound ports to allow"
#   # default     = 0
# }

# variable "sg_cass_protocol_nlb" {
#   description = "TCP | UDP"
#   # default     = "tcp"
# }

# variable "cass_ingress_cidr_nlb" {
#   description = "allowed subnets"
#   type        = list
#   # default     = ["192.168.0.0/16"]
# }

# variable "sg_cass_description_nlb" {
#   description = "rule descriptions"
#   default     = ""
# }

#--------------------------#
#CASS LB Security Group
#--------------------------#
variable "cass_lb_sg_name" {
  description = "Security Group name"
  # default     = "Terraform-created-cass-lb-sg"
}

variable "cass_lb_sg_description" {
  description = "Security Group description"
  default     = "Terraform-created-group"
}

#---------------------------------------#
#CASS Security Group TCP Ingress rule   #
#---------------------------------------#

variable "sg_cass_lb_tcp_inbound_ports" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "sg_cass_lb_tcp_protocol" {
  description = "TCP | UDP"
  # default     = "tcp"
}

variable "cass_lb_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_cass_lb_tcp_description" {
  description = "rule descriptions"
  default     = ""
}

#-----------------------------------------------#
#CASS Security Group TCP Ingress rule internal  #
#-----------------------------------------------#

variable "sg_cass_lb_tcp_internal_inbound_ports" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "cass_lb_tcp_ingress_cidr_internal" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_cass_lb_tcp_description_internal" {
  description = "rule descriptions"
  # default     = ""
}

#--------------------------#
#Linux Security Group
#--------------------------#
variable "linux_sg_name" {
  description = "Security Group name"
  # default     = "Terraform-created-linux-sg"
}

variable "linux_sg_description" {
  description = "Security Group description"
  # default     = "Terraform-created-group"
}

#----------------------------------#
#Linux Security Group Ingress rule  #
#----------------------------------#

variable "sg_linux_tcp_inbound_ports" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "sg_linux_tcp_protocol" {
  description = "TCP | UDP"
  # default     = "tcp"
}

variable "linux_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_linux_description" {
  description = "rule descriptions"
  # default     = ""
}

#----------------------------------------#
#Linux Security Group Ingress rule 9080  #
#----------------------------------------#

variable "sg_linux_9080_tcp_inbound_ports" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "sg_linux_9080_tcp_protocol" {
  description = "TCP | UDP"
  # default     = "tcp"
}

variable "linux_tcp_9080_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_linux_9080_description" {
  description = "rule descriptions"
  # default     = ""
}

#--------------------------#
# ITOPS Security Group	   #
#--------------------------#
# variable "itops_sg_name" {
#   description = "Security Group name"
#   # default     = "Terraform-created-itops-sg"
# }

# variable "itops_sg_description" {
#   description = "Security Group description"
#   # default     = "Terraform-created-group"
# }

#----------------------------------#
# ITOPS Security Group Ingress rule#
#----------------------------------#

# variable "sg_itops_inbound_ports" {
#   description = "inbound ports to allow"
#   # default     = 0
# }

# variable "sg_itops_protocol" {
#   description = "TCP | UDP"
#   # default     = "tcp"
# }

# variable "itops_ingress_cidr" {
#   description = "allowed subnets"
#   type        = list
#   # default     = ["192.168.0.0/16"]
# }

# variable "sg_itops_description" {
#   description = "rule descriptions"
#   # default     = ""
# }

#----------------------------------#
#Redshift Security Group Ingress rule  #
#----------------------------------#

variable "sg_cgms_redshift_inbound_ports" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "sg_cgms_redshift_protocol" {
  description = "TCP | UDP"
  # default     = "tcp"
}

variable "sg_cgms_redshift_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = ["192.168.0.0/16"]
}

variable "sg_cgms_redshift_description" {
  description = "rule descriptions"
  # default     = ""
}
#-----------------------------------------------------------------------------------------#
# IAM Specific Variables
#-----------------------------------------------------------------------------------------#
variable "role_name" {}


#-----------------------------------------------------------------------------------------#
# s3 Specific Variables
#-----------------------------------------------------------------------------------------#
variable "acl_gitea" {}
variable "acl_reportlite" {}
variable "bucket_name_gitea" {}
variable "bucket_name_reportlite" {}
variable "lifecycle_name" {}
variable "storage_class" {}

#-----------------------------------------------------------------------------------------#
# Redshift Specific Variables
#-----------------------------------------------------------------------------------------#
variable "subgrp_name" {
  type        = string
  # default     = "terraform created"
  description = "subnet group id name"
}

variable "subnet_grp_enabled" {
  # default     = false
  description = "If we need to create a new subnet group, enable this."
}

variable "parameter_gname_enabled" {
  # default     = false
  description = "If we need to create a new parameter group, enable this."
}

# variable "redshift-az-private-subnet-mapping" {
#   type = list
# }
# variable "subnet_ids" {
#   type        = list
#   description = "List of subnet group IDs for the cache subnet group."
# }

variable "parameter_gname" {
  # default     = "redshift-1.0"
  type        = string
  description = "The name of the parameter group."
}

variable "name" {
  type        = string
  description = "Redshift cluster name."
}


variable "database_name" {
  # default     = "terraform created"
  type        = string
  description = "Name of the DB."
}

variable "isencrypted" {
  description = "Determines if encrypted"
  # default     = false
}


variable "master_password" {
  # default     = "terraformcreated"
  type        = string
  description = "Master password for the DB."
}

variable "master_username" {
  # default     = "terraformcreated"
  type        = string
  description = "Master password for the DB."
}

variable "node_type" {
  # default     = ""
  type        = string
  description = "type of DB node."
}

variable "number_of_nodes" {
  # default     = "1"
  type        = string
  description = "number of nodes."
}

variable "enhancedvpc" {
  description = "(Optional) If true, enhanced VPC routing is enabled."
  # default     = false
}

variable "publicly_accessible" {
  description = "Determines if Cluster can be publicly available (NOT recommended)"
  # default     = false
}

variable "BU" {
  # default     = ""
  type        = string
  description = "Bussiness Unit Name."
}

# variable "securitygrp_ids" {
#   type        = list
#   description = "List of security group IDs for the redshift."
# }

#-----------------------------------------------------------------------------------------#
# mariadb Specific Variables
#-----------------------------------------------------------------------------------------#
# variable "db_vpc_security_group_ids" {
#   description = "security group ids"
#   type        = list
# }

# variable "db_subnet_group" {
#   description = "List of subnets to create the db_subnet_group"
#   type        = list
# }
# variable "mariadB-az-private-subnet-mapping" {
#   type = list
# }
variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  # default     = ""
}

#-------------------------------#
# RDS variables
#-------------------------------#

variable "rds_identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
}

variable "engine" {
  description = "The database engine to use"
}

variable "engine_version" {
  description = "The engine version to use"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  # default     = 50
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  # default     = "gp2"
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  # default     = ""
}

variable "db_master_username" {
  description = "Username for the master DB user"
}

variable "db_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  # default     = false
}
variable "db_backup_retention_period" {}
variable "db_backup_window" {}
variable "dB_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  # default     = false
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  # default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  # default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  # default     = false
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  # default     = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  # default     = true
}

variable "tags" {
  description = "all tags as a map"
  type = map(string)
  # default = {}
}
variable "option_group_name" {
  description = "Name of the DB option group to associate."
  # default     = ""
}
variable "availability_zone" {
  description = "The Availability Zone of the RDS instance"
  # default     = ""
}
variable "replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate."
  # default     = ""
}
variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  # default     = 0
}
variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  # default     = false
}
variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  # default     = ""
}
variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  # default     = ""
}
variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  # default     = false
}

#--------------------------------------------------------------------#
# kinesis_firehose variables
#--------------------------------------------------------------------#

variable "arn_deliverystream" {
  type        = string
  description = "arn for firehose delivery streams."
}
variable "bucketname" {
  type        = string
  # default     = "terraform created"
  description = "S3 bucket name"
}

# variable "database_name" {
#   default     = "terraform created"
#   type        = string
#   description = "Name of the DB."
# }

#variable "isencrypted" {
#  description = "Determines if encrypted"
#  default     = false
#}


variable "iam_role_name" {
  # default     = "terraformcreated"
  type        = string
  description = "Name of the IAM role."
}

variable "iam_role_policy_name" {
  # default     = "terraformcreated"
  type        = string
  description = "Name of the IAM rolepolicy ."
}

# variable "master_password" {
#   default     = "terraformcreated"
#   type        = string
#   description = "Master password for the DB."
# }

# variable "master_username" {
#   default     = "terraformcreated"
#   type        = string
#   description = "Master password for the DB."
# }

variable "acl" {
  # default     = ""
  type        = string
  description = "public or private"
}

variable "clusterjdbc" {
  # default     = ""
  type        = string
  description = "redshift cluster jdbc endpoint"
}

variable "copy_options" {
  description = "copy options for fireshose"
  # default     = ""
  type        = string
}

variable "copy_options1" {
  description = "copy options for fireshose"
  # default     = ""
  type        = string
}

variable "destination" {
  # default     = ""
  type        = string
  description = "whether its redshift or S3 or splunk etc."
}

variable "firehosenames" {
  default     = [""]
  type        = list
}


variable "firehosename1" {
  # default     = ""
  type        = string
  description = "firehose name."
}

variable "firehosename2" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename3" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename4" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename5" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename6" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename7" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename8" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename9" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename10" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename11" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename12" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename13" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename14" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename15" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename16" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename17" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename18" {
  # default     = ""
  type        = string
  description = "firehose name."
}
variable "firehosename19" {
  # default     = ""
  type        = string
  description = "firehose name."
}

variable "datatablename1" {
  # default     = ""
  type        = string
  description = "data table  name."
}

variable "datatablename2" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename3" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename4" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename5" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename6" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename7" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename8" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename9" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename10" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename11" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename12" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename13" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename14" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename15" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename16" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename17" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename18" {
  # default     = ""
  type        = string
  description = "data table  name."
}
variable "datatablename19" {
  # default     = ""
  type        = string
  description = "data table  name."
}

variable "bu" {
  # default     = "terraform"
  description = "Bussiness unit."
  type        = string
}

variable "application" {
  # default     = "terraform"
  description = "application name."
  type        = string
}

variable "tag_environment" {
  # default     = "terraform-created"
  description = "environment - prod, sim etc."
  type        = string
}

variable "tag_region" {
  # default     = "terraform-created"
  description = "name of the region."
  type        = string
}
#--------------------------------------------------------------------#
#  elasticsearch variables
#--------------------------------------------------------------------#
variable "domain_name" {
  description = "Domain name for the ES cluster"
}
//Set ES Version
variable "es_version" {
  description = "Version of ES to deploy"
  # default     = "6.8"
}

//VPC vars
# variable "elasticsearch_subnet_ids" {
#   description = "Subnet IDs to deploy into"
#   # default     = []
#   type        = list
# }
# variable "elasticsearch-az-private-subnet-mapping" {
#   type = list
# }
# variable "security_group_ids" {
#   description = "Security Group id to attach"
#   # default     = []
#   type        = list
# }

//EBS vars for data nodes
variable "ebs_size" {
  description = "EBS volume size"
  # default     = 80
}

variable "ebs_type" {
  description = "EBS volume type"
  # default     = "gp2"
}

variable "ebs_iops" {
  description = "IOPS for io1 volume type"
  # default     = "0"
}

//Instance vars
variable "master_instance_count" {
  description = "Number of master instances, 3/5"
  # default     = 3
}

variable "master_instance_type" {
  description = " Type of master instances"
  # default     = "t2.small.elasticsearch"
}

variable "data_instance_count" {
  description = "Number of data instances"
  # default     = 2
}

variable "data_instance_type" {
  description = "Type of data instances"
  # default     = "t2.small.elasticsearch"
}

//AZ awareness vars
variable "zone_awareness" {
  description = "Enable zone awareness"
  # default     = "false"
}

variable "az_count" {
  description = "Number of AZs. 1/2/3"
  # default     = 2
}

//Node to node encryption vars
variable "node_to_node_encryption" {
  description = "Enable node-to-node encryption"
  # default     = "false"
}

//Logging
//Slow Logs Index
variable "log_publishing_index_enabled" {
  description = "Enable slow log indexing"
  # default     = "false"
}

variable "log_publishing_index_cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch Log Group for Slow Index Logs"
  # default     = ""
}

//Search Slow Logs
variable "log_publishing_search_enabled" {
  description = "Enable slow log search"
  # default     = "false"
}

variable "log_publishing_search_cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch Log Group for Slow log search"
  # default     = ""
}

//App Logs
variable "log_publishing_application_enabled" {
  description = "Enable ES Application Logs"
  # default     = "false"
}

variable "log_publishing_application_cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch Log Group for ES Application Logs"
  # default     = ""
}

//Tags
variable "env" {
  description = "Environment"
  # default     = "dev"
}

# variable "BU" {
#   description = "Business unit"
#   default     = ""
# }

variable "appname" {
  description = "Application Name"
  # default     = ""
}

variable "create_service_linked_role" {
  default     = "false"
  # description = ""
}
#--------------------------------------------------------------------#
#  elasticache(redis) variables
#--------------------------------------------------------------------#
variable "eng_name" {
  type        = string
  description = "The name of the elasticache engine. redis or memcache"
}

variable "eng_ver" {
  # default     = "5.0.6"
  type        = string
  description = "The version number of the cache engine to be used for the cache clusters in this replication group."
}

variable "port" {
  type        = string
  description = "The port number on which each of the cache nodes will accept connections."
}

variable "numcache" {
  # default     = " "
  type        = string
  description = "Number of cache clusters."
}

variable "par_name" {
  # default     = "Terraform Created"
  type        = string
  description = "Parameter group name."
}
variable "par_name_cluster_mode_enabled" {
  # default     = "Terraform Created"
  type        = string
  description = "Parameter group name."
}
variable "nodetype" {
  # default     = ""
  type        = string
  description = "The type and associated memory size of the nodes to be deployed."
}

variable "num_cache_nodes" {
  # default     = "1"
  type        = string
  description = "The type and associated memory size of the nodes to be deployed."
}

# variable "sg_ids" {
#   type        = list
#   description = "List of security group IDs for the cache subnet group."
# }

variable "maintenance_win" {
  # default     = ""
  type        = string
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed."
}

variable "ec_az" {
  # default     = [""]
  type        = list
  description = "A list of EC2 availability zones in which the replication group's cache clusters will be created. "
}

variable "snap_win" {
  # default     = ""
  type        = string
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
}

variable "snap_reten_limit" {
  # default     = "5"
  type        = string
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
}

variable "automatic_failover" {
  # default     = false
  type        = string
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
}

# variable "at_rest" {
#   # default     = false
#   type        = string
#   description = "Whether to enable encryption at rest."
# }

# variable "transit_encry" {
#   # default     = false
#   type        = string
#   description = "Whether to enable encryption in transit."
# }

variable "redis_apply_immediately" {
  # default     = false
  type        = string
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
}

variable "replicas_per_node" {
  # default     = "1"
  type        = string
  description = " Number of replicas per node"
}

variable "num_node_group" {
  # default     = "2"
  type        = string
  description = " Number of node groups"
}
variable "auth_token" {}
variable "kms_key_id" {}
variable "snapshot_arns" {
  type = list
}
variable "at_rest_encryption_enabled" {}
variable "replication_enabled" {
  type = bool
}
variable "cluster_replication_enabled" { 
  type = bool
}
variable "notification_topic_arn" {}
variable "transit_encryption_enabled" {}
variable "snapshot_name" {}

variable "repl_grp" {
  type        = string
  description = "Replication group id."
}


variable "description" {
  # default     = "Managed by Terraform"
  type        = string
  description = "The description of the all resources."
}

variable "name_tag" {
  # default     = "Managed by Terraform"
  type        = string
  description = "Name of the resource."
}

variable "enviroment_tag" {
  # default     = "Managed by Terraform"
  type        = string
  description = "The env tag of the resources."
}

variable "bu_tag" {
  # default     = "Managed by Terraform"
  type        = string
  description = "The Bussiness unit of the elasticache."
}

variable "sn_grp_name" {
  # default     = ""
  type        = string
  description = "elasticache subnet group name."
}

# variable "sn_ids" {
#   type        = list
#   description = "List of subnet IDs for the cache subnet group."
# }

variable "sn_grp_desc" {
  # default     = ""
  type        = string
  description = "elasticache subnet group description."
}
#--------------------------------------------------------------------#
# cloudfront  variables
#--------------------------------------------------------------------#

variable "comment" {
  type        = string
  # default     = "terraform created"
  description = "some comment"
}

variable "root_object" {
  type        = string
  # default     = "terraform created"
  description = "root object"
}

variable "aliases" {
  
  # default     = [""]
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution"
}

variable "cloudfront_domain_name" {
  type        = string
  # default     = ""
  description = "The DNS domain name of either the S3 bucket, or web site of your custom origin."
}

variable "origin_id" {
  type        = string
  # default     = ""
  description = "A unique identifier for the origin."
}

variable "origin_protocol_policy" {
  type        = string
  # default     = "match-viewer"
  description = "The origin protocol policy to apply to your origin. One of http-only, https-only, or match-viewer."
}

variable "ssl_protocols" {
  type        = list
  # default     = ["TLSv1"]
  description = "The SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. A list of one or more of SSLv3, TLSv1, TLSv1.1, and TLSv1.2."
}

variable "bucket_domain_name" {
  type        = string
  # default     = ""
  description = "The Amazon S3 bucket to store the access logs in"
}

variable "bucket_name" {
  type        = string
  # default     = ""
  description = "The Amazon S3 bucket to store the access logs in"
}

variable "prefix" {
  type        = string
  # default     = ""
  description = "An optional string that you want CloudFront to prefix to the access log filenames for this distribution"
}

variable "cert_arn" {
  type        = string
  # default     = ""
  description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. Specify this, cloudfront_default_certificate, or iam_certificate_id. The ACM certificate must be in US-EAST-1."
}

variable "ssl_support_method" {
  type        = string
  # default     = "sni-only"
  description = "Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only."
}

variable "min_protocol_version" {
  type        = string
  # default     = "TLSv1.2_2018"
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections."
}

variable "default_cert" {
  # default     = false
  description = "if you want viewers to use HTTPS to request your objects and you're using the CloudFront domain name for your distribution."
}

variable "allowed_methods" {
  type        = list
  # default     = [""]
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
}

variable "cached_methods" {
  type        = list
  # default     = [""]
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
}

variable "target_origin_id" {
  type        = string
  # default     = ""
  description = "This should be same as origin ID"
}

variable "forward" {
  type        = string
  # default     = "all"
  description = "Specifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted_names"
}

variable "restriction_type" {
  type        = string
  # default     = "none"
  description = "The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
}

# variable "BU" {
#   type        = string
#   default     = "Terraform created"
#   description = "Bussiness Unit"
# }

variable "cloudfront_env" {
  type        = string
  # default     = "Terraform Created"
  description = "Environment"
}
variable "s3_bucket_create" {}
variable "query_string" {}
variable "compress" {}
variable "cloudfront_lifecycle_name" {}
variable "lifecycle_enabled" {}
variable "log_include_cookies" {}
variable "lifecycle_days" {}
variable "ipv6enabled" {}
variable "enabled" {}
variable "log_prefix" {}
variable "headers" {
  type = list
}
variable "default_ttl" {}
variable "viewer_protocol_policy" {}
variable "http_port" {}
variable "https_port" {}
variable "maxttl" {}
variable "minttl" {}
variable "read_timeout" {}
variable "keepalive_timeout" {}
#--------------------------------------------------------------------#
# eks  variables
#--------------------------------------------------------------------#
variable "vpc_name" {
  description = "name of the VPC"
  # default     = "Terraform-created"
}

variable "vpccidr" {
  description = "VPC cidr block"
}

variable "ig_gw_name" {
  description = "Internet Gateway Name"
  # default     = "Terraform-created-IG"
}

variable "nat_gw_name" {
  description = "NAT Gateway Name"
  # default     = "Terraform-created-NATGW"
}

variable "nat_gw_eip_name" {
  description = "NAT Gateway public IP name"
  # default     = "Terraform-created-Public-IP-NATGW"
}

variable "public_routetable_name" {
  description = "Public route table name"
  # default     = "Terraform-created-RTB-Public"
}

variable "private_routetable_name" {
  description = "Private route table name"
  # default     = "Terraform-created-RTB-Private"
}

variable "private_az_subnets_cidr" {
  type        = list(map(string))
  description = "Private subnets mapping"
}
variable "eks_gitea_private_az_subnets_cidr" {
  type        = list(map(string))
  description = "gitea Private subnets mapping"
}
variable "eks_neo4j_private_az_subnets_cidr" {
  type        = list(map(string))
  description = "neo4j Private subnets mapping"
}
variable "public_az_subnets_cidr" {
  type        = list(map(string))
  description = "Pubic subnets mapping"
}

###############################
#eksmaster  Security Group
###############################
variable "eksmaster_sg_name" {
  description = "Security Group name"
  # default     = "Terraform-created-sg"
}

variable "eksmaster_sg_description" {
  description = "Security Group description"
  default     = "Terraform-created-group"
}

######################################
#eksmaster Security Group Ingress rule
######################################

variable "sg_eksmaster_tcp_inbound_ports" {
  description = "inbound ports to allow"
  # default     = 0
}

variable "sg_eksmaster_tcp_protocol" {
  description = "TCP | UDP"
  # default     = ""
}

variable "sg_eksmaster_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = []
}

variable "sg_eksmaster_description" {
  description = "rule descriptions"
  default     = ""
}

#######################################
#EKS Cluster Variables
######################################
variable "eks_cluster_name" {
  description = "eks cluster name required"
}

variable "eks_iam_role_name" {
  description = "eks iam role "
  # default     = "eks-cluster-iamrole-terraform"
}

variable "eks_cluster_version" {
  description = "eks cluster version"
}

variable "eks_cluster_log_types" {
  description = "eks cluster log type api audit authenticator controller manager scheduler "
  type        = list
  # default     = []
}
variable "eks_endpoint_private_access" {}
variable "eks_endpoint_public_access" {}
variable "log_retention_days" {
  description = "log retention days"
  # default     = "7"
}

# variable "eks_security_groups_ids" {
#   description = "list of security groups id"
#   type        = list
#   # default     = []
# }

# variable "bu" {
#   default     = "terraform"
#   description = "Bussiness unit."
#   type        = string
# }

# variable "application" {
#   default     = "terraform"
#   description = "application name."
#   type        = string
# }

# variable "tag_environment" {
#   default     = "terraform-created"
#   description = "environment - prod, sim etc."
#   type        = string
# }

# variable "tag_region" {
#   default     = "terraform-created"
#   description = "name of the region."
#   type        = string
# }

#######################################
#EKS Cluster Worker Variables
######################################

variable "eks_node_group_name" {
  description = "eks cluster nodes group name"
  # default     = "eks-worknode-cluster-terraform"
}

variable "eks_node_group_iam_role" {
  description = "eks nodegroup iam role "
  # default     = "eks-worker-iamrole-terraform"
}

variable "instance_type" {
  description = "instance type for the lauch config"
  type        = list
  # default     = ["m5.large"]
}

variable "ami_type" {
  description = "ami type Valid values AL2_x86_64 AL2_x86_64_GPU"
  # default     = "AL2_x86_64"
}

variable "ec2_ssh_key" {
  description = "ec2 ssh key for worker nodes"
  # default     = ""
}

#root volume variables

variable "root_volume_size" {
  description = "The size of the volume in gibibytes (GiB)."
  # default     = "25"
}

variable "desired_capacity" {
  description = "desired capacity"
  # default     = "4"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
  # default     = "8"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  # default     = "2"
}

############################################
# EKS workers security group  variables
###########################################

variable "eks_sg_name" {
  description = "Security Group name"
  # default     = "Terraform-created-sg-eks-worker"
}

variable "eks_sg_description" {
  description = "Security Group description"
  # default     = "Terraform-created-group"
}

##########################################################
# EKS workers security group  variables Ingress rule
#########################################################

variable "sg_eksworker_tcp_inbound_ports" {
  description = "inbound ports to allow"
  # default     = "0"
}

variable "sg_eksworker_tcp_protocol" {
  description = "TCP | UDP"
  # default     = "tcp"
}

variable "sg_eksworker_tcp_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = []
}

variable "sg_eksworker_description" {
  description = "rule descriptions"
  default     = ""
}


variable "sg_eksmaster_all_inbound_ports" {
  description = "inbound ports to allow"
  # default     = "0"
}

variable "sg_eksmaster_all_protocol" {
  description = "TCP | UDP"
  # default     = "tcp"
}

variable "sg_eksmaster_all_ingress_cidr" {
  description = "allowed subnets"
  type        = list
  # default     = []
}

variable "sg_eksmaster_all_description" {
  description = "rule descriptions"
  default     = ""
}

#####################################################
# add additional node group - gitea
######################################################

#variable "eks_node_group_gitea_name" {
#  description = "eks cluster nodes group name"
#  default     = "eks-worknode-cluster-terraform"
#}

#variable "node_group_gitea_instance_type" {
#  description = "instance type for the new m5x node group"
#  type        = list
#  default     = ["m5.xlarge"]
#}

#variable "desired_capacity_gitea" {
#  description = "desired capacity"
#  default     = "1"
#}

#variable "max_size_gitea" {
#  description = "The maximum size of the auto scale group"
#  default     = "2"
#}

#variable "min_size_gitea" {
#  description = "The minimum size of the auto scale group"
#  default     = "1"
#}

#variable "eks_gitea_subnet_ids" {
#  description = "subnet ID's to have the gitea instance running to. It should match the current gitea pod subnet"
#  type        = list
#  default     = []
#}

#####################################################
# add additional node group - gitea-new nodegroup
######################################################

variable "eks_node_group_gitea_new_name" {
  description = "eks cluster nodes group name"
  # default     = "eks-worknode-cluster-terraform"
}

variable "node_group_gitea_new_instance_type" {
  description = "instance type for the new m5x node group"
  type        = list
  # default     = ["m5.xlarge"]
}

variable "desired_capacity_gitea_new" {
  description = "desired capacity"
  # default     = "1"
}

variable "max_size_gitea_new" {
  description = "The maximum size of the auto scale group"
  # default     = "2"
}

variable "min_size_gitea_new" {
  description = "The minimum size of the auto scale group"
  # default     = "1"
}

# variable "eks_gitea_new_subnet_ids" {
#   description = "subnet ID's to have the gitea instance running to. It should match the current gitea pod subnet"
#   type        = list
#   # default     = ["X"]
# }

#####################################################
# add additional node group - neo4j-new nodegroup
######################################################

variable "eks_node_group_neo4j_new_name" {
  description = "eks cluster nodes group name"
  # default     = "eks-worknode-cluster-terraform"
}

variable "node_group_neo4j_new_instance_type" {
  description = "instance type for the new m5x node group"
  type        = list
  # default     = ["m5.xlarge"]
}

variable "desired_capacity_neo4j_new" {
  description = "desired capacity"
  # default     = "1"
}

variable "max_size_neo4j_new" {
  description = "The maximum size of the auto scale group"
  # default     = "2"
}

variable "min_size_neo4j_new" {
  description = "The minimum size of the auto scale group"
  # default     = "1"
}

# variable "eks_neo4j_new_subnet_ids" {
#   description = "subnet ID's to have the neo4j instance running to. It should match the current neo4j pod subnet"
#   type        = list
#   # default     = ["xx"]
# }
variable "release_version" {
  description = "woker node release version"
  # default     = ""
}
variable "node_groups" {
  # default = {}
  type = list
}
variable "eks_endpoint_public_access_cidr" {
  description = "List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled. "
  type = list
  # default     = ["0.0.0.0/0"]
}

##################################################################################
## AnalyzerNG Variables
##################################################################################

#----------------------------------------------------------------------#
# iam module related varaibles 
#----------------------------------------------------------------------#
variable "iam_name" {}

variable "nsm_eks_worker_iam" {}#-------------------------------#

#----------------------------------------------------------------------#
## S3 Bucket variables                                                 #
#----------------------------------------------------------------------#

variable "prefix_analyzer"  {
   description = "prefix for name of the bucket"
}

#variable "acl" {
 #  description = "access control list for the bucket - private or public-read"
   #default =  "private"
#}

variable "s3_region"  {
   description = "region for S3"
}

variable "versioning"  {
   description = "versioning for S3 - true/false"
   #default     = false
}

variable "lifecycle_name_analyzer" {
  #default = "terraform created"
}

#variable "lifecycle_enabled" {
  #default = true
#}

variable "lifecycle_expiration_days" {
  description = "how many days to store S3 objects"
  #default     = 30
}

variable "analyzerng_logs_lifecycle_expiration_days" {
  description = "how many days to store analyzerNG S3 logs"
  #default     = 365
}


variable "block_public_acls" {
  #default = true
}

variable "ignore_public_acls" {
  #default = true
}

variable "block_public_policy" {
  #default = true
}

variable "restrict_public_buckets" {
  #default = true
}

variable "create_folder" {
  #default = true
}

variable "S3_key" {
  type        = string
  description = "name for folder inside S3Bucket"
  #default     = "terraform-created"
}

variable "flow_lifecycle_expiration_days" {}

variable "lifecycle_name_1" {}
variable "lifecycle_name_2" {}
variable "lifecycle_name_3" {}
variable "lifecycle_name_4" {}
variable "lifecycle_name_5" {}
variable "lifecycle_name_6" {}


variable "tagenv"  {
   description = "Environment tag for S3"
}

variable "tagregion"  {
   description = "Region tag for S3"
}

variable "Application"  {
   description = "Application"
}

variable "Applicationtype"  {
   description = "Applicationtype"
}

#variable "bu"  {
 #  description = "Bussiness Unit"
#}
variable "prevent_destroy" {}
 variable "force_destroy" {}

#----------------------------------------------------------------------#
## emr variables                                                 #
#----------------------------------------------------------------------#


variable "network_state_bucket" {
  description = "Name of the remote state bucket to pull the values"
}

variable "network_state_key" {
  description = "Key of the remote state bucket"
}

variable "network_state_region" {
  description = "Region of the remote state bucket"
}

# variable "vpc_id" {}

# variable "subnet_id" {}

#########################
## S3 Bucket variables ##
#########################

/*variable "prefix"  {
   description = "Prefix for the names"
}

variable "acl" {
   description = "access control list for the bucket - private or public-read"
   #default =  "private"
}

variable "lifecycle_enabled" {
  #default = true
}

variable "lifecycle_expiration_days" {
  description = "how many days to store S3 objects"
  #default     = "30"
}

variable "block_public_acls" {
  #default = true
}

variable "ignore_public_acls" {
  #default = true
}

variable "block_public_policy" {
  #default = true
}

variable "restrict_public_buckets" {
  #default = true
}*/

#variable "create_folder" {
#  #default = true
#}

/*variable "S3_key" {
  type        = string
  description = "name for folder inside S3Bucket"
  #default     = "terraform-created"
}

variable "bu"  {
   description = "Bussiness Unit"
}

variable "tagenv"  {
   description = "Environment tag for S3"
}

variable "Applicationtype" {}*/
#variable "tag_region"  {
 #  description = "Region tag for S3"
#}

###################
## EMR variables ##
###################

variable "name_analyzer" {
  #default = "Terraform Created"
}

variable "emr2_name" {
  #default = "Terraform Created"
}


variable "release_label" {
  #default = "emr-5.30.1"
}

variable "applications" {
  #default = ["Spark"]
  type    = list
}

variable "termination_protection" {
  #default = true
}

variable "ebs_root_volume_size" {
  #default = "52"
}


variable "key_name" {}


variable "environment" {}


#variable "application" {}


variable "visible_to_all_users" {
  default = true
}


variable "keep_job_flow_alive_when_no_steps" {
  default = true
}

variable "create_task_instance_fleet" {
  #default = true
}

variable "ebs_size_analyzer" {}

#variable "ebs_type" {}

variable "volumes_per_instance" {}

variable "master_instance_bidprice_percentage_1" {}

variable "master_instance_type_analyzer" {}

variable "master_fleet_name" {}

variable "master_target_on_demand_capacity" {}

variable "master_target_spot_capacity" {}

variable "core_instance_bidprice_percentage_1" {}

variable "core_instance_bidprice_percentage_2" {}

variable "core_instance_type_1" {}

variable "core_instance_weighted_capacity_1" {}

variable "core_instance_type_2" {}

variable "core_instance_weighted_capacity_2" {}

#variable "core_spot_allocation_strategy" {}

#variable "core_spot_block_duration_minutes" {}

#variable "core_spot_timeout_action" {}

#variable "core_spot_timeout_duration_minutes" {}

variable "core_fleet_name" {}

variable "core_target_on_demand_capacity" {}

variable "core_target_spot_capacity" {}

variable "task_instance_bidprice_percentage_1" {}

variable "task_instance_bidprice_percentage_2" {}

variable "task_instance_type_1" {}

variable "task_instance_weighted_capacity_1" {}

variable "task_instance_type_2" {}

variable "task_instance_weighted_capacity_2" {}

variable "task_instance_type_3" {}

variable "task_instance_weighted_capacity_3" {}

variable "task_instance_bidprice_percentage_3" {}

variable "task_instance_type_4" {}

variable "task_instance_weighted_capacity_4" {}

variable "task_instance_bidprice_percentage_4" {}

variable "task_spot_allocation_strategy" {}

variable "task_spot_block_duration_minutes" {}

variable "task_spot_timeout_action" {}

variable "task_spot_timeout_duration_minutes" {}

variable "task_fleet_name" {}

variable "task_target_on_demand_capacity" {}

variable "task_target_spot_capacity" {}

variable "scaling_unit_type" {}

variable "scaling_minimum_capacity_units" {}

variable "scaling_maximum_capacity_units" {}

variable "scaling_maximum_ondemand_capacity_units" {}

variable "scaling_maximum_core_capacity_units" {}

#------------------------------------------------------------------#
# Kinesis variables                                                #
#------------------------------------------------------------------#

variable "shard_count" {
 
  description = "no of shard count of Kinesis"
  #default     = 10

}

variable "retention_period" {
   description = "Period to store the data"
   #default     = 24
}

variable "application_type" {}


variable "flow_name" {}
variable "flow_shard_count" {
  description = "no of shard count of Kinesis"
  #default     = 10
}
variable "flow_retention_period" {
  description = "Period to store the data"
   #default     = 24
}
variable "url_name" {}
variable "url_shard_count" {

  description = "no of shard count of Kinesis"
  #default     = 5

}
variable "url_retention_period" {
   description = "Period to store the data"
   #default     = 24
}
variable "urlr_name" {}
variable "urlr_shard_count" {

  description = "no of shard count of Kinesis"
  #default     = 10

}
variable "urlr_retention_period" {
   description = "Period to store the data"
   #default     = 24
}

variable "url_ng_name" {}

variable "urlrating_ng_name" {}

variable "rt_ng_name" {}

#variable "BU" {
 # type        = string
  #description = "Bussiness unit"
  #default     = "Terraform"
#}

/*variable "application" {
  type        = string
  description = "Application which uses Kinesis"
  #default     = "Terraform"
}*/

variable "Environment" {
  type        = string
  description = "Environment, production, prodsim or test"
  #default     = "test"
}

variable "Name" {
  type        = string
  description = "Tag Name for the Application"
  #default     = "Terraform"
}

/*variable "tag_region" {
  type        = string
  description = "Region which Kinesis is located"
  #default     = "us-west-2"
}*/

#------------------------------------------------------------------#
# dynamodb variables                                                #
#------------------------------------------------------------------#

variable "db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}
variable "billing_mode" {
  description = "Controls how you are billed for read/write throughput and how you manage capacity. The valid values are PROVISIONED or PAY_PER_REQUEST"
  type        = string
  #default     = ""
}
variable "write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}
variable "hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "range_key" {
  description = "The attribute to use as the range (sort) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "stream_enabled" {
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
  default     = false
}

variable "stream_view_type" {
  description = "When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
  type        = string
  default     = null
}

variable "attribute_type" {
  description = "Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  type        = string
  #default     = ""
}

variable "range_attribute_type" {
  description = "Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data"
  type        = string
  #default     = ""
}


variable "alert_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "alert_write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "alert_read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "alert_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "trafficstats_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "trafficstats_write_capacity" {
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "trafficstats_read_capacity" {
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
  #default     = ""
}

variable "trafficstats_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}


variable "serial_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "serial_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "alertconfig_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "alertconfig_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "trafficalerts_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "trafficalerts_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "trafficstatsDebug_db_tablename" {
  description = "Name of the DynamoDB table"
  type        = string
  #default     = "name of db table"
}

variable "trafficstatsDebug_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "ANGRealtime_hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
  type        = string
  #default     = ""
}

variable "ANGRealtime_attribute_type" {}

variable "ANGRealtime_range_key" {}

variable "ANGRealtime_range_attribute_type" {}

variable "ttl_enabled" {
  description = "Indicates whether ttl is enabled"
  default     = false
}

variable "ttl_attribute_name" {
  description = "The name of the table attribute to store the TTL timestamp in"
  type        = string
  default     = "timetolive"
}

variable "server_side_encryption_enabled" {
  description = "Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)"
  default     = false
}

variable "server_side_encryption_kms_key_arn" {
  description = "The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the #default DynamoDB CMK, alias/aws/dynamodb."
  type        = string
  default     = "null"
}

variable "point_in_time_recovery_enabled" {
  description = "Whether to enable point-in-time recovery"
  default     = false
}

variable "tags_BU" {
  description = "key name"
  type        = string
  #default     = ""
}

variable "tags_Region" {
  description = "key value"
  type        = string
  #default     = ""
}

variable "tags_Application" {
  description = "key value"
  type        = string
  #default     = ""
}

variable "tags_Name" {
  description = "key name"
  type        = string
  default     = ""
}

#################################
## Redshift Specific Variables ##
#################################

variable "subgrp_name_analyzer" {
  type        = string
  #default     = "terraform created"
  description = "subnet group id name"
}

#variable "subnet_grp_enabled" {
  #default     = false
 # description = "If we need to create a new subnet group, enable this."
#}

#variable "parameter_gname_enabled" {
  #default     = false
 # description = "If we need to create a new parameter group, enable this."
#}


# variable "subnet_ids" {
#   type        = list
#   description = "List of subnet group IDs for the cache subnet group."
# }

variable "parameter_gname_analyzer" {
  #default     = "redshift-1.0"
  type        = string
  description = "The name of the parameter group."
}

/*variable "name" {
  type        = string
  description = "Redshift cluster name."
}*/


variable "database_name_analyzer" {
  #default     = "terraform created"
  type        = string
  description = "Name of the DB."
}

#variable "isencrypted" {
 # description = "Determines if encrypted"
  #default     = false
#}


variable "master_password_analyzer" {
  #default     = "terraformcreated"
  type        = string
  description = "Master password for the DB."
}

variable "master_username_analyzer" {
  #default     = "terraformcreated"
  type        = string
  description = "Master password for the DB."
}

variable "cluster_iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  type        = list(string)
  default     = []
}

variable "node_type_analyzer" {
  #default     = ""
  type        = string
  description = "type of DB node."
}

#variable "number_of_nodes" {
  #default     = "1"
 # type        = string
  #description = "number of nodes."
#}

#variable "enhancedvpc" {
 # description = "(Optional) If true, enhanced VPC routing is enabled."
  #default     = false
#}

#variable "publicly_accessible" {
 # description = "Determines if Cluster can be publicly available (NOT recommended)"
  #default     = false
#}

# variable "securitygrp_ids" {
#   type        = list
#   description = "List of security group IDs for the redshift."
# }

variable "preferred_maintenance_window" {
  description = "When AWS can run with maintenance window"
  type        = string
  default     = "sat:10:00-sat:10:30"
}

variable "paramname" {
  description  = "Parameter Name"
  type         = string
}


variable "paramvalue" {
  description  = "Prameter value"
  type         = string
}

/*variable "BU" {
  description  = "Business Unit"
  type         = string
}

variable "Application" {
  description  = "Application Name"
  type         = string
}

variable "Applicationtype" {
  description  = "Application Type"
  type         = string
}

variable "tag_region" {
  description  = "Region"
  type         = string
}*/

variable "tag_env" {
  description  = "Environment -Sim, prod etc"
  type         = string
}

#----------------------------------------------------#
# eks-collectet-NG variables
#----------------------------------------------------#

variable "cluster_name" {
  description = "Cluster Name"
}

variable "tcp_port" {
  description = "tcp port"
}

variable "protocol" {
  description = "protocol"
}

/*variable "vpc_id" {
  description = "ID of VPC"
}*/

variable "subnet_tags" {
  description = "subnet_tags"
}

# variable "vpc_private_subnets" {
#   description = "VPC private cidr blocks"
# }

variable "cluster_version" {
  description = "Kubernetes cluster version"
}

variable "log_types" {
  description = "Log types"
}

variable "log_retention_in_days" {
  description = "log retention in days"
}

#variable "worker_group_one_name" {
#  description = "Name of worker group one"
#}


variable "instance_type_group_one" {
  description = "instance type of worker group one"
}


#variable "platform_group_one" {
#  description = "platform of worker group one"
#}


variable "asg_desired_capacity_group_one" {
  description = "asg_desired_capacity of worker group one"
}


variable "asg_max_size_group_one" {
  description = "asg_max_size of worker group one"
}

variable "asg_min_size_group_one" {
  description = "asg_min_size of worker group two"
}

variable "ssh_key" {
  description = "ssh_key"
}

/*variable "environment" {
  description = "environment(prod, prodsim, dev etc)"
}

variable "tag_region" {
  description = "region of deployment"
}*/


variable "applicationtype" {
  description = "applicationtype"
}


/*variable "bu" {
  description = "Bussiness Unit"
}

variable "application" {
  description = "application name"
}*/

variable "nodegroup_name" {
  description = "Nodegroup Name"
}

variable "cidr_blocks_all_worker_groups" {
  description = "All worker groups"
  type = list(string)
}

variable "cluster_endpoint_private_access_cidrs" {
  description = "All CIDR that needs access to EKS cluster"
  type = list(string)
}


variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::940XXXXXXX359:user/btkubendran"
      username = "btkubendran"
      groups   = ["system:masters"]
    },
  ]
}

#################################
## Athena Specific Variables   ##
#################################

variable "athena_name" {
  type        = string
  #default     = "terraform created"
  description = "name of athena database"
}

variable "athena_workgroup_name" {
  type        = string
  description = "terraform-created"
}

variable "workgroup_force_destroy" {
  #default     = true
  description = "true to destroy workgroup even if results are there"
}

variable "named_query" {
  type        = string
  description = "name of named query"
}

variable "athena_bucket_acl" {
  type        = string
  #default     = "Private"
  description = "S3 bucket acl"
}

variable "athena_bucket_key" {
  type        = string
  #default     = "Private"
  description = "S3 bucket folder name to be created"
}

#-------------------------------------------------------------------#
#  ec2 module variables
#-------------------------------------------------------------------#

variable "emr_network_state_key" {}
#-----------------------------#
#Applies to all the EC2
#-----------------------------#

/*variable "prefix" {
  type        = string
  #default     = "terraform created"
  description = "Prefix for the resources"
}*/


#variable "az_one_id" {
#  description = "az one id"
#  #default     = ""
#}

#variable "az_two_id" {
#  description = "az two id"
#  #default     = ""
#}

variable "az_one_cidr" {
  description = "az one cidr block"
}

#variable "az_two_cidr" {
#  description = "az two cidr block"
#}

# variable "security_group_ids" {
#   description = "security group ids"
#   type        = list(string)
# }

#variable "enviroment_tag" {
 # description = "enviroment_tag"
#}

#variable "bu_tag" {
 # description = "bu_tag"
#}

variable "applicationName_tag" {
  description = "Bussiness Unit"
}

variable "region_tag" {
  description = "Region of ec2"
}

variable "applicationtype_tag" {
  description = "Application Type"
}

variable "deploymenttype_tag" {
  description = "Type of deployment"
  default     = "Terraform"
}


#-------------------------------#
# EMR Client1 variables
#-------------------------------#

variable "emr_client1_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "emr_client1_ami" {
  description = "AMI to use"
}

variable "emr_client1_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "emr_client1_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

variable "number_of_ebs_emr_client1" {
  description = "number of EBS to attach"
  #default     = 1
}

variable "ebs_volume_size_emr_client1" {
  description = "the size of the 2nd volume"
  #default     = 50
}

variable "ebs_device_name_emr_client1" {
  description = "device name for EBS mapping see AWS Doc for full list"
  type        = list(string)
  #default     = ["/dev/sdf"]
}


variable "machineType_emr_client1" {
  description = "machine type"
}

#-------------------------------#
# EMR Client 2 variables
#-------------------------------#


variable "emr_client2_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "emr_client2_ami" {
  description = "AMI to use"
}

variable "emr_client2_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "emr_client2_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

variable "number_of_ebs_emr_client2" {
  description = "number of EBS to attach"
  #default     = 1
}

variable "ebs_volume_size_emr_client2" {
  description = "the size of the 2nd volume"
  #default     = 50
}

variable "ebs_device_name_emr_client2" {
  description = "device name for EBS mapping see AWS Doc for full list"
  type        = list(string)
  #default     = ["/dev/sdf"]
}

variable "machineType_emr_client2" {
  description = "machine type"
}

variable "delete_volume_on_termination"{

 description = "Whether the volume should be destroyed on instance termination"
 #default = true

}

#variable "ebs_iops" {
 # description = "IOPS provision. This must be set for volume type io1"
  #default = 0
#}
variable "volume_type"{

 description = "The type of volume Can be standard gp2 io1 sc1 or st1"
 #default = "gp2"
}
variable "ami_monitoring" {
  description = "if true, the launched EC2 instance will have detailed monitoring enabled"
  #default = false
}
variable "ami_termination_protection" {
  description = "if true, enables EC2 instance termination protection"
  #default = false

}
variable "associate_public_ip_address" {
  description = "Associate a public IP address "
  #default = false
}

variable "volume_iops"{

 description = "The amount of provisioned IOPS. This is only valid for volume_type of io1, and must be specified if using that type"
 #default = 0
}

variable "ebs_optimized"{
   description = "If true, the launched EC2 instance will be EBS-optimized."
   #default = false
}
variable "ebs_volume_type" {
  description = "the type of EBS volume. standard, gp or io1"
  #default     = "gp2"

}

variable "ami_shutdown_behavior" {
  description = "Shutdown behavior for the EC2 instance"
  #default = "stop"

}
variable "iam_instance_profile" {
   description = "iam role for the EC2"
   default =  ""
}
variable "sd_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. defaults true"
  default = true
}
#################################
## lambda Specific Variables  ##
#################################

variable "athena_network_state_key" {
  description = "Key of the remote state bucket"
}

variable "s3_network_state_key" {
  description = "Key of the remote state bucket"
}

variable "function_name" {
  description = "A unique name for your Lambda Function."
  type        = string
}
variable "description_analyzer" {
  description = "Description of what your Lambda Function does."
  type        = string
}
variable "runtime" {
  description = "See Runtimes for valid values."
}
variable "handler" {
  description = "The function entrypoint in your code."
  type        = string
}
variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. defaults to 128."
}
variable "filename" {
  description = "Name of the function ZIP file."
  type        = string
}
variable "concurrency" {
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. "
}
variable "lambda_timeout" {
  #default     = 5
  description = "The amount of time your Lambda Function has to run in seconds. defaults to 5"
}
variable "log_retention" {
  #default     = 14
  description = "Specifies the number of days you want to retain log events in the specified log group."
}

/*variable "tag_region" {
  description = "region tag."
  type        = string
}
variable "application" {
  description = "application tag."
  type        = string
}
variable "bu" {
  description = "Bussiness Unit."
  type        = string
}
variable "Applicationtype" {
  description = "application Type tag."
  type        = string
}*/
#variable "tag_environment" {
 # description = "environment name - eg sim, production etc."
  #type        = string
#}
variable "schedulejobs_filename" {}

variable "logparser_runtime" {}

variable "logparser_filename" {}

variable "logparser_description" {}

variable "logprocessor_filename" {}

variable "logprocessor_description" {}

variable "realtimereport_filename" {}

variable "realtimereport_description" {}

variable "s3bucketmonitor_filename" {}

variable "s3bucketmonitor_description" {}

variable "terminaterestartemr_filename" {}

variable "terminaterestartemr_description" {}

variable "emr_logprocessor" {}

variable "emr_logparser" {}

variable "deleteDynamodb_description" {}

variable "deleteDynamodb_filename" {}

variable "terminatemrdynamodb_description" {}

variable "terminatemrdynamodb_filename" {}

variable "stepFunction_filename" {}

variable "stepFunction_description" {}

variable "logProcessor_new_filename" {}

variable "logProcessorWeb_filename" {}

variable "ANG-Setup_filename" {}

variable "secret_names" {}

variable "ANG-ops_filename" {}

variable "ANG-lambda_update_filename" {}

variable "ANG-lambda_partitionprojection_filename" {}

variable "ANG-lambda_WeeklyRedShiftCommands_filename" {}

variable "ANG-lambda_ReadRedShiftData_filename" {}

variable "ANG-lambda_ReadKinesisDataStream_filename" {}

variable "ANG-lambda_MonitorDataEmail_filename" {}

#-------------------------------#
#Nsv variables
#-------------------------------#

variable "nsv_number" {
  description = "number of ec2 to deploy"
  #default     = 1
}

variable "nsv_ami" {
  description = "AMI to use"
}

variable "nsv_ami_instance_type" {
  description = "the type of instance i.e t2.nano t2.micro etc"
  #default     = "t2.nano"
}

variable "nsv_volume_size" {
  description = "the size of the volume"
  #default     = 100
}

/*variable "key_name" {
  description = "the key file"
}*/

#variable "az_one_id" {
#  description = "az one id"
#  #default     = ""
#}

# variable "az_one_public_id" {
#   description = "az one id of public"
#   #default     = ""
# }

variable "az_one_public_cidr" {
  description = "az one public cidr block"
}

# variable "private_security_group_ids" {
#   description = "private security group ids of LBs"
#   type        = list(string)
# }

# variable "ami_private_subnet_id" {
# description = "private security group ids of LBs"
  
# }

# variable "security_group_lb_ids" {
#   description = "security group ids of LBs"
#   type        = list(string)
# }


#------------------------------------------------------#
#NSv LAN Nic variable for the attach Nic on the 1st NSv
#------------------------------------------------------#
variable "nsv1_lan_ip" {
  description = "the LAN ip for the Nsv Firewall, has to match the az where its being deployed"
  type        = list(string)
}

/*variable "enviroment_tag" {}

variable "bu_tag" {}

variable "applicationName_tag" {}

variable "region_tag" {}

variable "applicationtype_tag" {}
*/


variable "ebs_device_name" {

  description = "Ebs mount point"
  type        = list(string)
  #default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]

}



variable "ebs_volume_number" {
 description = "number of extra volumes"
 #default = 1

}

variable "ebs_volume_size"{
 description = "ebs size"
 #default = 10
}


variable "machineType_tag" {}

#################################
## Crawler Specific Variables  ##
#################################

variable "crawler_name" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_url" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_appsdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_coredata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_ifacedata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_memdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_reportdata" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_flowblocked" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawler_name_flowthreat" {
  type        = string
  #default     = "terraform created"
  description = "Crawler name"
}

variable "crawl_behaviour" {}

#############################
# cloudwatch_monitoring #
#############################

variable "kinesis_stream_names" {
  description = "Name of the kinesis stream to monitor"
  #type        = string
}
// Kinesis Iterator Age Alarm Settings
variable "kinesis_iterator_age_error_threshold" {
  description = "The value against which the specified statistic is compared."
}

variable "kinesis_iterator_age_error_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "kinesis_iterator_age_error_period" {
  description = "The period in seconds over which the specified stat is applied."
}

// Redshift EMR
#variable "name" {
 # type        = string
  #description = "Redshift cluster name."
  #default = "redshift-analyzerng-cluster"
#}

variable "cpu_threshold" {
  description = "The value against which the specified statistic is compared."
}

variable "redshift_evaluation_periods" {}

variable "redshift_period" {}


# --------------------------------------------------------------------- #
# Rafay Cluster Import and related Variables
# --------------------------------------------------------------------- #
variable "rest_endpoint" {}
variable "ops_endpoint" {}
variable "api_key" {}
variable "api_secret" {}
variable "rafay_project_name" {}
variable "blueprint" {}
variable "blueprintversion" {}


#-------------------------------------------#
# MongoDB-Atlas       #
#-------------------------------------------#
variable "public_key" {
  description = "The public API key for MongoDB Atlas"
}
variable "private_key" {
  description = "The private API key for MongoDB Atlas"
}

variable "atlas_region" {
  default     = "US_EAST_1"
  description = "Atlas Region"
}
variable "aws_region" {
  default     = "ap-southeast-1"
  description = "AWS Region"
}
variable "atlas_dbuser" {
  description = "The db user for Atlas"
}
variable "atlas_dbpassword" {
  description = "The db user passwd for Atlas"
}
variable "atlas_vpc_cidr" {
  description = "Atlas CIDR"
  #default     = ""
}

variable "aws_account_id" {
  description = "My AWS Account ID"
 # default     = ""
}


variable "vpc_id" {
 #default = "vpc-090d6746f40097acf"
}
variable "project_id" {}
variable "num_shards" {}
variable "electable_nodes" {}
variable "priority" {}
variable "read_only_nodes" {}
variable "provider_backup_enabled" {}
variable "auto_scaling_disk_gb_enabled" {}
variable "mongo_db_major_version" {}
variable "provider_name" {}
variable "disk_size_gb" {}
variable "provider_instance_size_name" {}
variable "cidr_block" {}
variable "enable_dns_hostnames" {}
variable "enable_dns_support" {}
variable "destination_cidr_block" {}

#--------------------------------------#
#        KMS              #
#--------------------------------------#
variable "key_spec" {}
variable "kms_alias" {}
variable "rotation_enabled" {}
variable "user_arn" {}

#----------------------------------------#
#  NSM-Neptune       #
#----------------------------------------#
variable "neptune_cluster_name" {
  type = string
}
variable "neptune_engine" {
  type = string
}
variable "neptune_instance_class" {
  type = string
}
variable "neptune_publicly_accessible" {
  type = string
}
variable "backup_retention_period" {
  type = string
}
variable "preferred_backup_window" {
  type = string
}
variable "neptune_skip_final_snapshot" {
  type = string
}
variable "neptune_iam_database_authentication_enabled" {
  type = string
}
variable "neptune_apply_immediately" {
  type = string
}
variable "neptune_sg_name" {}
variable "neptune_count" {}

variable "availability_zones" {
  type = list(string)
}