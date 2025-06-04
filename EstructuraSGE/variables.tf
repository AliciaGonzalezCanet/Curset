variable "key_pair" {
  description = "Nom del teu key pair AWS"
  type        = string
}

variable "region" {
  description = "Regió AWS"
  type        = string
  default     = "eu-west-1"
}

variable "ami_id" {
  description = "AMI Ubuntu 24per a EC2"
  default     = "ami-0c55b159cbfafe1f0" 
}

variable "tipo_instance" {
  description = "Tipus d’instància"
  type        = string
  default     = "t3.micro"
}


