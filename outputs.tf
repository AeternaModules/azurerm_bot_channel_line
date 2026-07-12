output "bot_channel_lines_id" {
  description = "Map of id values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.id }
}
output "bot_channel_lines_bot_name" {
  description = "Map of bot_name values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.bot_name }
}
output "bot_channel_lines_line_channel" {
  description = "Map of line_channel values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.line_channel }
  sensitive   = true
}
output "bot_channel_lines_location" {
  description = "Map of location values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.location }
}
output "bot_channel_lines_resource_group_name" {
  description = "Map of resource_group_name values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.resource_group_name }
}

