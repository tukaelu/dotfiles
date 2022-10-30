local status, git = pcall(require, 'git')
if (not status) then return end

git.setup {
  keymaps = {
    -- Open blame window
    blame = 'gb',
    -- Close lame window
    quit_blame = 'q',
    -- Open file/folder in git repository
    browse = 'go',
    -- Open a new diff that compares against the current index
    diff = 'gd',
    -- Close diff window
    diff_close = 'q',
  }
}
