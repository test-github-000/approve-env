variable "project" {
  default = "infra"
}

variable "appname" {
  default = "github"
}

variable "environment" {
  default = "main"
}

variable "region" {
  default = "eu-central-1"
}

variable "regioncode" {
  default = "euc1"
}

locals {
  project = var.project
  appname = var.appname
  environment = var.environment
  region = var.region
  regioncode = var.regioncode
  #availaibilityzone
  naming = {
    ec2 = "${local.project}_${local.appname}_${local.environment}_${local.regioncode}_ec2"
    sg = "${local.project}_${local.appname}_${local.environment}_${local.regioncode}_sg"
    s3 = "nonpci_${local.project}_${local.appname}_${local.environment}"
  }
}


resource "null_resource" "debug" {

  triggers = {
    debug = jsonencode(local.naming)
  }
}
