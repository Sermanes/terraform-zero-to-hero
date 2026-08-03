output "count_files" {
  description = "Resources created with count, addressed by index."
  value       = { for f in local_file.count_demo : f.id => f.filename }
}

output "foreach_files" {
  description = "Resources created with for_each, addressed by key."
  value       = { for k, f in local_file.foreach_demo : k => f.filename }
}

output "canary" {
  description = "The canary pet's id, or null when enable_canary is false."
  value       = try(random_pet.canary[0].id, null)
}
