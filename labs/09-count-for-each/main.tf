# count indexes by position: var.environments[count.index]. Removing an
# element from the front of the list shifts every index after it.
resource "local_file" "count_demo" {
  count = length(var.environments)

  filename = "${path.module}/generated/count-${var.environments[count.index]}.txt"
  content  = "Environment: ${var.environments[count.index]}"
}

# for_each indexes by key: each.value is one element of the set, and the
# key itself (the string) identifies the instance, not its position.
resource "local_file" "foreach_demo" {
  for_each = toset(var.environments)

  filename = "${path.module}/generated/foreach-${each.value}.txt"
  content  = "Environment: ${each.value}"
}

# count as a 0/1 toggle: a common pattern for a resource that only
# sometimes exists, something for_each has no equally direct equivalent for.
resource "random_pet" "canary" {
  count  = var.enable_canary ? 1 : 0
  length = 2
}
