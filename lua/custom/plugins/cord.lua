local lang_table = {
  ts = 'TS',
  js = 'JS',
  tsx = 'TS React',
  jsx = 'JS React',
  py = 'Python',
  java = 'Java',
  c = 'C',
  cpp = 'C++',
  rs = 'Rust',
  go = 'Go - Lets Go! See what I did there?',
  lua = 'Lua',
  vim = 'Vim',
  sh = 'Shell',
  html = 'HTML',
  css = 'CSS',
  json = 'JSON',
  toml = 'TOML',
  markdown = 'Markdown',
  md = 'Markdown',
  tex = 'LaTeX',
  sql = 'SQL',
  dockerfile = 'Dockerfile',
  make = 'Makefile',
  cmake = 'CMake',
  yaml = 'YAML',
  h = 'Header - SEND HELP',
  m = 'Objective-C - ABANDON ALL HOPE, YE WHO ENTER',
  mm = 'Objective-C++ - REALLY OFF THE DEEP END',
  zig = 'Zig - prolly stuck in comptime hell',
  cs = 'C#',
  properties = 'Properties',
  proto = 'Protocol Buffers',
  rb = 'Ruby',
  php = 'PHP',
  xml = 'XML',
  swift = "Swift - ...someday I'll use you on the server.",
  kt = 'Kotlin',
  dart = 'Dart',
  ex = 'Elixir ',
  exs = 'Elixir Script',
  hs = 'Haskell',
  scala = 'Scala',
  clj = 'Clojure',
  tf = 'Terraform - AHHHHHHH',
  hcl = 'HCL - AHHHHHHH',
  svelte = 'Svelte ',
  vue = 'Vue - Uh oh',
  r = 'R',
  groovy = 'Groovy',
  tpl = 'Template',
  twig = 'Twig',
  graphql = 'GraplQL - Query all the things',
  lisp = "Your Father's parantheses, elegant weapons... for a more civilized age",
}

return {
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    opts = {
      text = {
        editing = function(opts)
          local lang = lang_table[opts.filetype] or opts.filetype
          return string.format('%s', lang)
        end,
        viewing = function(opts)
          local lang = lang_table[opts.filetype] or opts.filetype
          return string.format('%s', lang)
        end,
        file_browser = function(opts)
          return '📁 File Browser'
        end,
        docs = function(opts)
          return '📖 Documentation'
        end,
        vcs = function(opts)
          return '📦 Version Control'
        end,
        debug = function(opts)
          return '🐛 Debugging'
        end,
        test = function(opts)
          return '🧪 Testing'
        end,
        diagnostics = function(opts)
          return '🚦 Diagnostics'
        end,
        terminal = function(opts)
          return '🖥️ Terminal'
        end,
        workspace = function(opts)
          local hour = tonumber(os.date '%H')
          local status = hour >= 22 and '🌙 Late night coding'
            or hour >= 18 and '🌆 Evening session'
            or hour >= 12 and '☀️ Afternoon coding'
            or hour >= 5 and '🌅 Morning productivity'
            or '🌙 Midnight hacking'

          return string.format('%s', status)
        end,
      },
    },
  },
}
