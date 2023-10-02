terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "local" {
  # Configuration options
}


# <block_name> <resource_type> <resource_name>
resource "local_file" "hello" {
  content  = "hello ${data.local_file.name.content}"
  filename = "./${each.value}.txt"
  for_each = var.file_name
}

data "local_file" "name" {
  filename = "./name.txt"
}
variable "file_name" {
  type = set(string)
  default = [ "hello1", "hello2", "hello3" ]
  
}