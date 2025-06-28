terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }
}
resource "null_resource" "test" {

}

resource "null_resource" "test1" {

}

output "test" {
  value = "null_resource.test.id"
}