# nvim

Example configuration for Neovim.

## Usage

This configuration was tested with `Neovim v0.8`, so I cannot guarantee that everything will work with an older version.

If you want to use this configuration locally (and you have Neovim installed), you will need to copy the contents into your `$HOME/.config/nvim` folder.

## Keybinds

Here are some custom keybinds that were added to the configuration (to see all of them type `<Space>fk`):

**Navigation:**

- `<Space>f`: prompts which key for navigation like keybinds
- `]` or `[`: prompts whick key for bracket navigation
- `-`: opens telescope file browser from current buffer dir

**Editor:**

- `gcc`: for commenting out a line

**Testing:**

- `<Space>t`: prompts which key for testing commands

**Terminal:**

- `\\`: to toggle the floating terminal instance

**LSP:**

- `K`: hover over a symbol and get help documentation
- `gd`: hover over a symbol and go to definition
- `gr`: hover over a symbol and get all the references to it
- `<Space>rn`: hover over a symbol and rename it everywhere

## Structure

The [Lazy Plugin Manager](https://github.com/folke/lazy.nvim) allows you to group your plugin configurations in a manner that you see fit. I organized the configuration in this way, but you may find a better way that works better for you.

The core strategy that I used for this configuration was to group the the files according to their respective domain. So when I want to adjust settings for the autocomplete engine, I open up [lsp.lua](./lua/user/plugins/lsp.lua), whereas when I want to change the colorscheme, I open [ui.lua](./lua/user/plugins/ui.lua).

Another distinction that I make, is between [core](./lua/user/core) and [plugins](./lua/user/plugins). The idea here is that I can always use the core configurations if I for whatever reason do not have the ability to install plugins.

```shell
.
├── init.lua                  # entrypoint into config
├── lazy-lock.json            # pinned plugin dependencies (autogenerated)
└── lua                       # directory with configurations
   └── user                   # name of config module
      ├── core                # submodule for internal configurations
      │  ├── autocommands.lua # autocommands that are not related to plugins
      │  ├── keybinds.luaq    # keybinds that are not related to plugins
      │  └── options.lua      # options that are not related to plugins
      ├── lazy.lua            # lazy plugin manager setup configuration
      └── plugins             # submodule for plugin configurations
         ├── editor.lua       # general editor related plugins
         ├── lsp.lua          # programming related plugins
         ├── navigation.lua   # navigation plugins for better finding
         ├── terminal.lua     # terminal plugins for better terminal integration
         ├── testing.lua      # testing plugins for testing in file
         └── ui.lua           # user interface related plugins
```
