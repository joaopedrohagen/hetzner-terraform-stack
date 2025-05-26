provider "hcloud" {
  token = var.hcloud_token
  # Configures the interval in which actions
  # are polled by the client. Default 500ms.
  # Increase this interval if you run into rate limiting errors.
  # pool_interval = "500ms"
}
