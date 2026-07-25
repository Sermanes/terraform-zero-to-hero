resource "random_pet" "office" {
  length    = 2
  separator = "-"

  lifecycle {
    prevent_destroy = true
  }
}

resource "local_file" "notice" {
  filename        = "${path.module}/notice.txt"
  content         = "Office pet of the month: ${random_pet.office.id}"
  file_permission = "0600"

  lifecycle {
    create_before_destroy = true
  }
}
