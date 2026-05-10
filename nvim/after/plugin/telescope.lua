
local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous"
            },
            n = {
                ["j"] = "move_selection_next",
                ["k"] = "move_selection_previous"
            }
        }
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
})

telescope.load_extension("fzf")

local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Find files" } )
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Grep string" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Old files" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>fc", function()
        builtin.find_files {
            cwd = vim.fn.stdpath("config")
        }
    end,
    { desc = "Config files" }
)

map("n", "<leader>bb", ":!cmake -S . -B build -G Ninja -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_CXX_FLAGS=-fdiagnostics-color=always && cmake --build build<CR>", { desc = "Generate CMake & build" })
map("n", "<leader>br", ":!./build/beekeeper<CR>", { desc = "Run target" })

