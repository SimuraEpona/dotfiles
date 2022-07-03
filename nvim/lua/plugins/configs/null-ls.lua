local present, nullls = pcall(require, "null-ls")

if not present then
  return
end

local b = nullls.builtins

local sources = {
  b.formatting.stylua,
  b.formatting.mix,
}

local options = {
  sources = sources,
}

nullls.setup(options)
