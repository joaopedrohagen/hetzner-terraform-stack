variable "tags" {
  description = "User defined tags for your projects"
  type        = map(any)
}

variable "network_name" {
  description = "User defined network name"
  type        = string
}

variable "instances_config" {
  description = "User defined instances configs"
  type = map(object({
    name = string
    datacenter = string

    rules = map(object({
      direction = string
      protocol = string
      port = string
      source_ips = list(string)
    }))
  }))
}
