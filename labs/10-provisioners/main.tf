resource "null_resource" "bootstrap" {
  provisioner "local-exec" {
    command = "echo 'bootstrap started' > ${path.module}/bootstrap.log"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'bootstrap torn down' > ${path.module}/bootstrap.log"
  }
}

resource "null_resource" "flaky" {
  provisioner "local-exec" {
    on_failure = continue
    command    = "echo 'flaky ran' > ${path.module}/does-not-exist/flaky.log"
  }
}
