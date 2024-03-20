# AutoBashScripts
Bash scripts that I made to be able to Compile Run and Test faster in NeoVim

## Add to Shell
In .Bashrc/.zshrc
```
alias YOURCHOICE='PATH/TO/FILE <<<'
```
## Add to Vim

In remap file
```
vim.keymap.set("n", "REMAP", function()
  vim.cmd("!PATH/TO/FILE <<< %")
end)
```
