resource "random_pet" "office" {
  length    = 2
  separator = "-"
}

# external/office-notice.txt is not managed by Terraform: it's a file
# someone else wrote by hand and committed to the repo. Reading it doesn't
# depend on any resource, so Terraform can resolve this during plan.
data "local_file" "manual_note" {
  filename = "${path.module}/external/office-notice.txt"
}

resource "local_file" "notice" {
  filename = "${path.module}/notice.txt"
  content  = "${data.local_file.manual_note.content}\nOffice pet of the month: ${random_pet.office.id}"
}

# Simulates a tool outside Terraform (a script, another pipeline) writing a
# file as a side effect. The filename references random_pet.office.id, so
# Terraform already knows it must run after that resource; what it can't
# infer is that the file also depends on this null_resource having run,
# since local-exec doesn't produce any attribute the data block reads.
resource "null_resource" "audit_log" {
  triggers = {
    pet = random_pet.office.id
  }

  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/audit && printf 'audit entry for %s\\n' '${random_pet.office.id}' > ${path.module}/audit/audit-${random_pet.office.id}.log"
  }
}

data "local_file" "audit_entry" {
  filename   = "${path.module}/audit/audit-${random_pet.office.id}.log"
  depends_on = [null_resource.audit_log]
}
