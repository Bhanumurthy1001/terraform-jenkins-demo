variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1" # change to "us-west-2" if you prefer
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}


variable "db_name" {
  description = "Database name"
  type        = string
  default     = "mydb"
}

variable "db_user" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "db_pass" {
  description = "Database password"
  type        = string
  default     = "Password123!"
}
