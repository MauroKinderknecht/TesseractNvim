-- Default user settings

local user_config = require('tesseract.config.config')

local default_config = {
    border = 'rounded',
    disable_builtin_plugins = {},
    add_plugins = {},
    plugins = {
      lsp_lines = {
        enable_on_start = false,
      },
    },
    lsp = {
        format_on_save = true,
        format_timeout = 3000,
        rename_notification = true,
        -- table of callbacks pushed via plugins
        on_attach_mappings = {},
        -- lsp servers that should be installed
        ensure_installed = {},
        -- lsp servers that should be enabled
        servers = {},
    },
}

local u = require('tesseract.utils')
local config = u.merge(default_config, user_config)

function config.lsp.add_on_attach_mapping(callback)
    table.insert(config.lsp.on_attach_mappings, callback)
end

function config.lsp.can_client_format(client)
    -- formatting enabled by default if server=true
    if config.lsp.servers[client.name] == true then
        return true
    end

    -- check config server settings
    if config.lsp.servers[client.name] then
        -- default to true if no format flag on server settings is set
        if config.lsp.servers[client.name].format == nil then
        return true
        end

        -- check format flag on server settings
        return (config.lsp.servers[client.name].format == true)
    end

    return true
end

return config

