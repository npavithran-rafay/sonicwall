aws_region                          = "us-east-2" #Ex. us-west-2

#AWS Neptune
neptune_cluster_name                        = "rafay-cluster" # Ex. my_cluster
neptune_engine                              = "neptune" # neptune
neptune_instance_class                      = "db.r5.large"
neptune_publicly_accessible                 = "false" # Bool
backup_retention_period             = "1" # Int
preferred_backup_window             = "" # Ex. 07:00-09:00
neptune_skip_final_snapshot                 = "true" # Bool
neptune_iam_database_authentication_enabled = "false" # Bool
neptune_apply_immediately                   = "true" # Bool
neptune_sg_name                     = "neptune-sg"
neptune_count                       = "2"
availability_zones                  = ["us-east-1b" , "us-east-1c"]