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
  #blockname.resource_type.resource_name.attribute(content or content_base64)
  content  = "hello ${data.local_file.name.content}"
  filename = "./${each.value}.txt"
  file_permission = 700
  # here we use a meta argument 
  for_each = var.file_name
}

data "local_file" "name" {
  filename = "./name.txt"
}
variable "file_name" {
  type = set(string)
  default = [ "hello1", "hello2", "hello3" ]
  
}   