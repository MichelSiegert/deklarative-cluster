variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "zone" {
  description = "The GCP zone"
  type        = string
}

variable "local_sa_keys" {
  description = "Path to local sa keys"
  type        = string
}

variable "local_user" {
  description = "name of local user"
  type        = string
}

variable "worker_count" {
  type    = number
  default = 1
}
