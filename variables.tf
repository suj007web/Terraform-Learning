
variable "os_auth_url" {
  description = "The OpenStack Identity (Keystone) authentication URL."
  type        = string
}


variable "os_username" {
  description = "The OpenStack username to authenticate with."
  type        = string
}


variable "os_password" {
  description = "The OpenStack user password."
  type        = string
  sensitive   = true
}


variable "os_project_name" {
  description = "The OpenStack project (tenant) name where resources will be created."
  type        = string
}


variable "os_region" {
  description = "The OpenStack region to use."
  type        = string
}

variable "image_id" {
    description = "The id of the image to use for the instance."
    type        = string
}

variable "flavor_name" {
    description = "The flavor (instance type) to use for the instance."
    type        = string
}

variable "network_name" {
    description = "The name of the network to attach the instance to."
    type        = string
}