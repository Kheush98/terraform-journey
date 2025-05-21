variable "REGION" {
  default = "us-east-1"
}

variable "ZONE" {
  default = "us-east-1a"
}

variable "AMI_ID" {
  type = map(any)
  default = {
    us-east-1 = "ami-084568db4383264d4"
    us-east-2 = "ami-04f167a56786e4b09"
  }
}

variable "USER" {
  default = "ubuntu"
}

variable "INST_TYPE" {
  default = "t2.micro"
}