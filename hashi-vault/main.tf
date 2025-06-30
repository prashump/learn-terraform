data "vault_generic_secret" "secret" {
  path = "demo/ssh"
}

provider "vault" {
  address = "http://vault.prashumps.online:8200"
  token = var.token
}

variable "token" {}

resource "local_file" "vault" {
  content  = jsonencode(data.vault_generic_secret.secret.data["user"])
  filename = "/tmp/vault"
}