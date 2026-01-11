resource "azurerm_bot_channel_line" "bot_channel_lines" {
  for_each = var.bot_channel_lines

  bot_name            = each.value.bot_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  line_channel {
    access_token = each.value.line_channel.access_token
    secret       = each.value.line_channel.secret
  }
}

