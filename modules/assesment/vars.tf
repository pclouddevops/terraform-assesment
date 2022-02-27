variable "region" {
  description = "Choose the region"
  default     = "us-east-1"
}

variable "environment" {
  description = "environment name"
  default     = "dev"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "public_key" {}
variable "ami_name" {}
variable "vpc_id" {}