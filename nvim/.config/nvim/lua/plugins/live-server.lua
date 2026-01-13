return {
  'barrett-ruth/live-server.nvim',
  config = function()
    require('live-server').setup {
      build = 'npm add -g live-server',
      cmd = { 'LiveServerStart', 'LiveServerStop' },

    }
  end
}
