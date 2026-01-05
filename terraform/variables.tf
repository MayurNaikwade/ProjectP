variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "projectp-api"
}

variable "domain_name" {
  type    = string
  default = "mayurnaikwade.com"
}

variable "app_subdomain" {
  type    = string
  default = "api"
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}

# Reusing existing ECR repo
variable "ecr_repo_name" {
  type    = string
  default = "simple-web-app/projectp-api"
}

variable "image_tag" {
  type    = string
  default = "manual1"
}

variable "cpu_alarm_threshold" {
  type    = number
  default = 70
}
