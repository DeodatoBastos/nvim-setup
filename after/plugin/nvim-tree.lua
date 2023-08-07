local custom_icons = require("utils.icons")

local function start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  require("telescope.builtin")[telescope_mode] {
    cwd = basedir,
  }
end

local function custom_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local function telescope_live_grep(_)
        start_telescope "live_grep"
    end

    local function telescope_find_files(_)
        start_telescope "find_files"
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "t", api.node.open.tab, opts("New Tab"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Folder"))
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "gtg", telescope_live_grep, opts("Telescope Live Grep"))
    vim.keymap.set("n", "gtf", telescope_find_files, opts("Telescope Find Files"))
    vim.keymap.set("n", '?', api.tree.toggle_help, opts('Help'))
end

require("nvim-tree").setup({
    sort_by = "name",
    view = {
        adaptive_size = false,
        centralize_selection = true,
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
    },
    renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "none",
        -- root_folder_label = ":t",
        indent_width = 2,
        indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = custom_icons.ui.Text,
                symlink = custom_icons.ui.FileSymlink,
                bookmark = custom_icons.ui.BookMark,
                folder = {
                    arrow_closed = custom_icons.ui.TriangleShortArrowRight,
                    arrow_open = custom_icons.ui.TriangleShortArrowDown,
                    default = custom_icons.ui.Folder,
                    open = custom_icons.ui.FolderOpen,
                    empty = custom_icons.ui.EmptyFolder,
                    empty_open = custom_icons.ui.EmptyFolderOpen,
                    symlink = custom_icons.ui.FolderSymlink,
                    symlink_open = custom_icons.ui.FolderOpen,
                },
                git = {
                    unstaged = custom_icons.git.FileUnstaged,
                    staged = custom_icons.git.FileStaged,
                    unmerged = custom_icons.git.FileUnmerged,
                    renamed = custom_icons.git.FileRenamed,
                    untracked = custom_icons.git.FileUntracked,
                    deleted = custom_icons.git.FileDeleted,
                    ignored = custom_icons.git.FileIgnored,
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {},
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = custom_icons.diagnostics.BoldHint,
            info = custom_icons.diagnostics.BoldInformation,
            warning = custom_icons.diagnostics.BoldWarning,
            error = custom_icons.diagnostics.BoldError,
        },
    },
    filters = {
        custom = { "^.git", "node_modules", "\\.cache" },
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 200
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "shadow",
                style = "minimal",
            },
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                picker = "default",
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    tab = {
        sync = {
            open = false,
            close = false,
            ignore = {},
        },
    },
    notify = {
        threshold = vim.log.levels.INFO,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    on_attach = custom_on_attach,
})


vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)
