vim.lsp.handlers["$/progress"] = function(_, result, ctx)
  local value = result.value
  if not value or not value.kind then return end

  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then return end

  local msg = ""
  if value.kind == "begin" then
    msg = string.format("[%s] %s...", client.name, value.title or "")
  elseif value.kind == "report" then
    if value.percentage then
      msg = string.format("[%s] %s... (%d%%)", client.name, value.message or value.title or "", value.percentage)
    else
      msg = string.format("[%s] %s...", client.name, value.message or value.title or "")
    end
  elseif value.kind == "end" then
    msg = string.format("[%s] %s ✓", client.name, value.title or "")
  end

  if msg ~= "" then
    vim.defer_fn(function()
      vim.api.nvim_echo({ { msg, "ModeMsg" } }, false, {})
    end, 0)
  end
end
