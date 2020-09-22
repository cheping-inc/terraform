variable "appli" {
  default = "appli-01"
}

variable "project" {
  default = "users-instances"
}

variable "env" {
  default = "all"
}

variable "my_users" {
  description = "List of users"
  default = {
    "user1" = { name = "camille" }
    "user2" = { name = "anna" }
  }
}

variable "my_instances" {
  description = "List of instances for appli"
  default = {
    "instance1" = { name = "http1", tag = "web server 1" }
    #"instance2" = { name = "http2", tag = "web server 2" }
  }
}

variable "my_instance_key" {
  default = "~/terraform/key/default_ec2.pem"
}

