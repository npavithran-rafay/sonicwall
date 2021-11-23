#variable aws_access_key {}
#variable aws_secret_key {}
#variable aws_region {}
#variable vpcid {}
#variable subnetsid {}

variable vpcid {
    default = "vpc-2bc8ce50"
}
variable subnetsid {
    type = "list"
    default = ["subnet-ccd94886","subnet-771edc2b"]
}
