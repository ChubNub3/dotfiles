local g = vim.g
local o = vim.o
local opt = vim.opt
local A = vim.api
local keymap = vim.api.nvim_set_keymap

g.mapleader = "'"

keymap('i', 'jj', '<ESC>', {noremap = true})
keymap('n','<leader>a', '<C-w>w', {noremap = true})
keymap('n','<leader>t', ':CHADopen', {noremap = true})

o.relativenumber = true

require('packer-plugins')
