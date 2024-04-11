local ok, gen = pcall(require, 'gen')
if not ok then
  return
end

gen.setup({
  -- https://github.com/David-Kunz/gen.nvim
  -- https://github.com/ollama/ollama
  -- requires locally installed ollama and appropriate models
  model = "phi",
  host = "localhost",
  port = "11434",
  quit_map = "q",
  retry_map = "<c-r>",
  display_mode = "split",
  show_prompt = false,
  show_model = false,
  no_auto_close = false,
  debug = false,
  init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
  command = function(options)
    local body = {model = options.model, stream = true}
    return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
  end,
})

gen.prompts = {
  ["Generate content"] = {
    prompt = "$input",
  },
  ["Generate content and replace document"] = {
    prompt = "$input",
    replace = true
  },
  ["Replace the text with a markdown list"] = {
    prompt = "Render the following text as a markdown list:\n$text",
    replace = true,
  },
  ["Replace the text with a markdown table"] = {
    prompt = "Render the following text as a markdown table:\n$text",
    replace = true,
  },
  ["Review code and provide suggestions"] = {
    prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
  },
  ["Modify the code according to a prompt"] = {
    prompt = "Regarding the following code, $input, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```",
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>cg', '<cmd>Gen<cr>')
