resource "random_pet" "office" {
  length    = 2
  separator = "_"
}

resource "local_file" "notice" {
  filename = "${path.module}/notice.txt"
  content  = "Office pet of the month: ${random_pet.office.id}"
}
