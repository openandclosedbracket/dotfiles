return {
  "jellydn/quick-code-runner.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = function()
    -- Define the C file execution command
    local c_command = {
      -- 1. Use the shell command to compile the file
      -- $fileName: The name of the current file (e.g., Hello.c)
      -- $fileNameWithoutExt: The name without extension (e.g., Hello)
      "gcc $fileName -o /tmp/$fileNameWithoutExt",

      -- 2. Chain the execution of the compiled binary
      "&& /tmp/$fileNameWithoutExt",

      -- 3. (Optional) Chain the removal of the temporary binary
      "&& rm /tmp/$fileNameWithoutExt",
    }

    return {
      debug = true,
      -- This is where you add the filetype configuration
      file_types = {
        -- 'c' is the filetype detected by Neovim for C files
        c = c_command,
      },
    }
  end,
  cmd = { "QuickCodeRunner", "QuickCodePad" },
  keys = {
    -- Keymap for running VISUALLY SELECTED code
    {
      "<leader>cr",
      ":QuickCodeRunner<CR>",
      desc = "Quick Code Runner (Visual)",
      mode = "v",
    },
    -- Keymap for running the WHOLE FILE in Normal mode
    {
      "<leader>cr",
      "gg0vGg$:QuickCodeRunner<CR>",
      desc = "Quick Code Runner (File)",
      mode = "n",
    },
    {
      "<leader>cp",
      ":QuickCodePad<CR>",
      desc = "Quick Code Pad",
    },
  },
}
