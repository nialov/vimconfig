{ pkgs, dsl, ... }:
with dsl; {
  plugins = with pkgs; [
    dracula
    vimPlugins.lualine-nvim
    vimPlugins.tabline-nvim
    vimPlugins.nvim-web-devicons
    node-type-nvim
    # statusline-action-hints

    # jump to character on line
    quick-scope
  ];

  vimscript = ''
    colorscheme dracula
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#ff0000' guibg='#0000ff' ctermfg='196'
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#880000' guibg='#000088' gui=underline ctermfg='196'
  '';

  setup.tabline.show_index = false;

  setup.node-type = {};
  # setup.statusline-action-hints = {
  #     definition_identifier = "gd";
  #     template = "%s ref:%s";
  # };

  setup.lualine = {
    options = {
      component_separators = {
        left = "";
        right = "";
      };
      section_separators = {
        left = "";
        right = "";
      };
      globalstatus = true;
    };
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" "diff" "diagnostics" ];
      lualine_c = [ "filename" ];
      lualine_x = [/* (rawLua "require(\"statusline-action-hints\").statusline") */ (rawLua "require(\"node-type\").statusline") "encoding" "fileformat" ];
      lualine_z = [ "location" ];
    };
    tabline = { };
    extensions = { };
  };
}
