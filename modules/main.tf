# group of resource to be created is called as module
# module sources

module "sample1" {
  source = "./sample"
  x=100
}

module "sample2" {
  source = "./sample"
  x=var.x
}

variable "x" {
  default = 100
}