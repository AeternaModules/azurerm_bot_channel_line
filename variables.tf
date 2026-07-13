variable "bot_channel_lines" {
  description = <<EOT
Map of bot_channel_lines, attributes below
Required:
    - bot_name
    - location
    - resource_group_name
    - line_channel (block):
        - access_token (required)
        - secret (required)
EOT

  type = map(object({
    bot_name            = string
    location            = string
    resource_group_name = string
    line_channel = list(object({
      access_token = string
      secret       = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        length(v.line_channel) >= 1
      )
    ])
    error_message = "Each line_channel list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        length(v.bot_name) >= 4
      )
    ])
    error_message = "[from validate.BotName: invalid when len(value) < 4]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        length(v.bot_name) <= 42
      )
    ])
    error_message = "[from validate.BotName: invalid when len(value) > 42]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        alltrue([for item in v.line_channel : (length(item.access_token) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        alltrue([for item in v.line_channel : (length(item.secret) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

