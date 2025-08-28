# Configuration Neovim

Cette repo contient ma configuration pour [Neovim](https://neovim.io/).

Nécessite `Neovim >= 0.11`
## TL;DR
Cette config contient notamment
- Quelques [raccourcis](#raccourcis)
- [Support des langages](#support-des-langages) via [Lazy](https://github.com/folke/lazy.nvim) et [Mason](https://github.com/mason-org/mason.nvim)
- [Thème et apparence](#thème-et-apparence) via colorscheme et Lualine
- Une sélection de [Plugins](#plugins) : Nvim-tree, Copilot, Harpoon, autopair, telescope

## Installation
Pour trouver l'emplacement de l'installation `config_path`, ouvrir Neovim et taper la commande `:echo stdpath("config")`. Ouvrir ensuite un terminal et cloner cette repository dans `config_path` :
```sh
git clone https://github.com/Ledugus/nvim-config.git <config_path>
```
## Comment ça marche
Au lancement, Neovim lit le fichier `init.lua` dans `.config/nvim/`. Ce fichier `require` les fichiers de setup se trouvant dans `lua/user/`. Le premier est `remap.lua`, qui enregistre quelques [raccourcis](#raccourcis). Le second est `set.lua` qui enregistre des options globales. Le dernier est `lazy.lua`, le gestionnaire de plugins. 

Les plugins sont simplement des tableaux décrivant les options et la fonction `config` appelée au lancement. Pour ajouter un plugin, il suffit donc de rajouter un fichier `lua/user/plugins/my_plugin.lua` de la forme : 
```lua
return {
  "<plugin_path>.nvim", -- see the right path on plugin's official repo
  dependencies = { <all_dependencies> },
  config = function()
    require(<plugin>).setup( { <plugin options> })
    vim.keymap.set("n", "<keymap>", <function_to_call>, {<options>})
  end,
}
```


## Raccourcis
Normal mode : 
- `<leader>rp` : Save and run current file with Python3.
- `<leader>mm` : Save file and compile current class with manim.
- `gd` : Go to definition
- `<leader>h` : See documentation of current element
- `<leader>vd` : View diagnostics on current line
- `<leader>vrr` : View references of current element
- `<leader>r` : File-wide rename of current element

Visual mode : 
- `J` : Move all selected lines down
- `K` : Move all selected lines up
## Support des langages
L'équivalent des extensions de langage dans VSCode est le Language Server Protocol (LSP). Le fichier `lsp.lua` gère l'installation et la configuration de ces plugins. 

Langages supportés actuellement
- Lua : `lua_ls` (lsp et linter), stylua (formatter)
- Python : `pyright` (lsp), `ruff` (lsp & linter) et `black` (formatter)
- C : `clangd` (lsp, formatter et linter)
- Javascript/Typescript : `ts_ls` (lsp et linter), `prettier` (formatter)
- Typst : `tinymist` (lsp, formatter et linter)

## Thème et apparence
Le thème est [onedark](https://github.com/navarasu/onedark.nvim). 

La barre d'état est gérée par le plugin [LuaLine](https://github.com/nvim-lualine/lualine.nvim).
## Plugins
- [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) : Explorateur de fichiers amélioré
- [Copilot](https://github.com/navarasu/onedark.nvim) : Complétion et suggestion
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) : Recherche rapide dans tout le projet. Raccourcis :
  - `<leader>pf` : Recherche dans les noms de fichiers
  - `<leader>ps` : Recherche globale dans tout le projet
- [Harpoon](https://github.com/ThePrimeagen/harpoon) : Quick switcher. Raccourcis
  - `<leader>a` : Ajouter un fichier
  - `<C-e>` : Ouvrir le Menu
  - `<C-e>, <C-t>, <C-n>` : Ouvrir les fichiers 1, 2, 3 respectivement.
- [Autopair](https://github.com/windwp/nvim-autopairs) : Gestion intelligente des parenthèses
- [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) : Fenêtre popup de terminal
