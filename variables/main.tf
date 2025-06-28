variable "x" {
  default = 10
}

output "x" {
  value = var.x
}

# string, number, boolean
# string requires double quotes

variable "str" {
  default = "Hello"
}

# variable "num" {
#   default = 20
# }
#
# variable "mybool" {
#   default = true
# }

output "string" {
  value = "${var.str}, steve"
}

variable "a" {
  default = "this is normal variable"
}

variable "b" {
  default = [
    1, 2, "abc", false
  ]
}

variable "c" {
  default = {
    a = 10
    b = 20
    z = "mps"
  }
}

output "b1" {
  value = var.b[0]
}

output "c1" {
  value = var.c["z"]
}

output "a1" {
  value = var.a
}

variable "cli" {
  default = 1
}

output "cli-is" {
  value = var.cli
}

variable "v" {}

output "v-value" {
  value = var.v
}