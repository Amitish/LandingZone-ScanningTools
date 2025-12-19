variable "asg" {
  description = "A map of application security groups to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    nic_name            = string
  }))
}