return {
  'mistweaverco/kulala.nvim',
  opts = {},
  config = function()
    vim.filetype.add({
      extension = {
        ['http'] = 'http',
      },
    })
  end
}

-- https://kulala.mwco.app --> official website for ref
