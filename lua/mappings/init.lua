-- Mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--VIMRC
map('n', '<leader>ev', ':e $MYVIMRC<cr>', opts)

--NERDTree
map('n', '<leader>1', ':NvimTreeToggle<cr>', opts)

-- No arrow keys - use hjkl
map('n', '<up>', '<nop>', opts)
map('n', '<down>', '<nop>', opts)
map('i', '<up>', '<nop>', opts)
map('i', '<down>', '<nop>', opts)
map('i', '<left>', '<nop>', opts)
map('i', '<right>', '<nop>', opts)

-- Center the search results
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

-- Switch Buffers with Left and Right
map('n', '<left>', ':bp<cr>', opts)
map('n', '<right>', ':bn<cr>', opts)

-- Close buffer
map('n', '<leader>d', ':bd<cr>', opts)

-- Laravel Mappings 
map('n', '<leader>lr',':e routes/web.php<cr>', opts)
map('n', '<leader>lm', ':!php artisan make:', opts)
map('n', '<leader>lp', ':!php artisan', opts)
map('n', '<leader>lfc', ':e app/Http/Controllers/<cr>', opts)
map('n', '<leader>lfm', ':e app/Models<cr>', opts)
map('n', '<leader>lfv', ':e resources/views/<cr>', opts)
map('n', '<leader>la', ':e routes/api.php<cr>', opts)

-- Rust
map('n', '<leader>rm', ':e ./src/main.rs<cr>', opts)
map('n', '<leader>rl', ':e ./src/lib.rs<cr>', opts)
map('i', ';;', '<ESC>A;<ESC>', opts)

