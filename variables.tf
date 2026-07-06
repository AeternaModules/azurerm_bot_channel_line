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
    line_channel = object({
      access_token = string
      secret       = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        length(v.line_channel.access_token) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_lines : (
        length(v.line_channel.secret) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_bot_channel_line's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: bot_name
  #   source:    [from validate.BotName] !ok
  # path: bot_name
  #   condition: length(value) >= 4
  #   message:   [from validate.BotName: invalid when len(value) < 4]
  #   source:    [from validate.BotName: invalid when len(value) < 4]
  # path: bot_name
  #   condition: length(value) <= 42
  #   message:   [from validate.BotName: invalid when len(value) > 42]
  #   source:    [from validate.BotName: invalid when len(value) > 42]
  # path: bot_name
  #   source:    [from validate.BotName] !regexp.MustCompile(`^[a-zA-Z0-9][a-zA-Z0-9_-]*$`).MatchString(v)
}

