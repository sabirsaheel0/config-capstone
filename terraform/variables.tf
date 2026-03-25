variable "vpc-name" {
  description = "vpc-name"
  type        = string
  default     = "capstone-vpc"
}

variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
  default     = "10.0.0.0/20"
}