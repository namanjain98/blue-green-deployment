variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey_blue"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey_blue.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-south-1 = "ami-09a7bbd08886aafdf"
    us-east-1= "ami-0a0ddd875a1ea2c7f"
    eu-west-1 = "ami-08a2aed6e0a6f9c7d"
  }
}
