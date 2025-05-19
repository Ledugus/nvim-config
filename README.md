# Configuration Neovim

Cette repo contient ma configuration pour [Neovim](https://neovim.io/).

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
- `
## Support des langages
## Thème et apparence
## Plugins
