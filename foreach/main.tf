# variable "nodes" {
#   default = {
#     test1 = {
#       vm_size = "Standard_B2s"
#     }
#     test2 = {
#       vm_size = "Standard_B2s"
#     }
#   }
# }
#
# for_each = var.nodes
# name = "${each.key}-ip"
# vm_size = each.value["vm_size"]

