variable "environments" {
  description = "Environments to generate a marker file for."
  type        = list(string)
  default     = ["dev", "staging", "prod"]
}

variable "enable_canary" {
  description = "Whether to create the canary pet."
  type        = bool
  default     = false
}
