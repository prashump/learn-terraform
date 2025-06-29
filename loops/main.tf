terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }
}
resource "null_resource" "test" {
  count = 10
}

output "test" {
  value = null_resource.test[*].id
}

output "testx" {
  value = null_resource.test[1].id
}

# count resourcelabel.locallabel[*].attribute
# looping purpose count is not good to use

# variable "nodes" {
#   default = [
#     "test1",
#     "test2"
#   ]
# }
