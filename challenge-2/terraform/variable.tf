variable "sample_app_image_repo" {
  type = string
}

variable "fluentd_output_awsKey" {
  type = string
  sensitive = true
}

variable "fluentd_output_awsSecret" {
  type = string
  sensitive = true
}