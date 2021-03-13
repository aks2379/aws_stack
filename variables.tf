variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-2"
}

variable "Security_Group" {
  type    = list(string)
  default = ["sg-00110", "sg-00120", "sg-00130"]
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "stack_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "stack_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}