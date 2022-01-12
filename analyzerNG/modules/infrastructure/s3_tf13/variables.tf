

variable "bucketname"  {

   description = "Name of the bucket"

}

variable "acl" {

   description = "access control list for the bucket - private or public-read"
   #default =  "private"

}

variable "region"  {
   description = "region for S3"
}

variable "versioning"  {

   description = "versioning for S3 - true/false"
   #default     = false
}


variable "force_destroy" {
  #default = true
}

variable "prevent_destroy" {
  #default = false
}

#variable "lifecycle_name" {
#  #default = "terraform created"
#}

#variable "lifecycle_enabled" {
#  #default = false
#}

#variable "lifecycle_expiration_days" {
#  description = "how many days to store S3 objects"
#  #default     = 30
#}

variable "lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management."
  type        = any
 # default     = []
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
  #default = false
}

variable "S3_key" {
  type        = string
  description = "name for folder inside S3Bucket"
 # default     = "terraform-created"
}

variable "server_side_encryption_configuration" {
  description = "Map containing server-side encryption configuration."
  type        = any
 # default     = {}
}

variable "Application"  {

   description = "Application"

}

variable "Applicationtype"  {

   description = "Applicationtype"

}

variable "bu"  {

   description = "Bussiness Unit"

}

variable "tagenv"  {

   description = "Environment tag for S3"

}

variable "tagregion"  {

   description = "Region tag for S3"

}

