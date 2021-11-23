#-----------------------------------------------------------------#
# Configure Terragrunt to automatically store tfstate files in S3 #
#-----------------------------------------------------------------#

include {
  path = find_in_parent_folders()
}

# Declare the dependencies
dependencies {
  paths = ["../emr"]
}

