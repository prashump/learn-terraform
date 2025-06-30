data "vault_generic_secret" "secret" {
  path = "demo/ssh"
}

provider "vault" {
  address = "https://vault.prashumps.online:8200"
  token = var.token
}

variable "token" {}