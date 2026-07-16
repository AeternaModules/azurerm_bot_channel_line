output "bot_channel_lines_id" {
  description = "Map of id values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bot_channel_lines_bot_name" {
  description = "Map of bot_name values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.bot_name if v.bot_name != null && length(v.bot_name) > 0 }
}
output "bot_channel_lines_line_channel" {
  description = "Map of line_channel values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.line_channel if v.line_channel != null && length(v.line_channel) > 0 }
  sensitive   = true
}
output "bot_channel_lines_location" {
  description = "Map of location values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.location if v.location != null && length(v.location) > 0 }
}
output "bot_channel_lines_resource_group_name" {
  description = "Map of resource_group_name values across all bot_channel_lines, keyed the same as var.bot_channel_lines"
  value       = { for k, v in azurerm_bot_channel_line.bot_channel_lines : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}

