output "bot_channel_lines" {
  description = "All bot_channel_line resources"
  value       = azurerm_bot_channel_line.bot_channel_lines
  sensitive   = true
}
output "bot_channel_lines_bot_name" {
  description = "List of bot_name values across all bot_channel_lines"
  value       = [for k, v in azurerm_bot_channel_line.bot_channel_lines : v.bot_name]
}
output "bot_channel_lines_line_channel" {
  description = "List of line_channel values across all bot_channel_lines"
  value       = [for k, v in azurerm_bot_channel_line.bot_channel_lines : v.line_channel]
  sensitive   = true
}
output "bot_channel_lines_location" {
  description = "List of location values across all bot_channel_lines"
  value       = [for k, v in azurerm_bot_channel_line.bot_channel_lines : v.location]
}
output "bot_channel_lines_resource_group_name" {
  description = "List of resource_group_name values across all bot_channel_lines"
  value       = [for k, v in azurerm_bot_channel_line.bot_channel_lines : v.resource_group_name]
}

