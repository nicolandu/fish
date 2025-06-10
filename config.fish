if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g theme_color_scheme gruvbox
    set -g theme_nerd_fonts yes

    abbr --add y xsel -b # [Y]ank to clipboard
    abbr --add p xsel -ob # [P]aste from clipboard
    abbr --add nv nvim
    abbr --add vi nvim
    abbr --add vim nvim
    abbr --add lg lazygit
    abbr --add tp trash-put
    abbr --add tm tmux
    abbr --add tmnw tmux new-win
    abbr --add xo xdg-open .

    function multicd
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end
    abbr --add dotdot --regex '^\.\.+$' --function multicd

    set -g fish_key_bindings fish_vi_key_bindings
    # Emulates vim's cursor shape behavior
    # Set the normal and visual mode cursors to a block
    set fish_cursor_default block
    # Set the insert mode cursor to a line
    set fish_cursor_insert line
    # Set the replace mode cursors to an underscore
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    # Set the external cursor to a line. The external cursor appears when a command is started.
    # The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
    set fish_cursor_external line
    # The following variable can be used to configure cursor shape in
    # visual mode, but due to fish_cursor_default, is redundant here
    set fish_cursor_visual block

    # C-F autocomplete
    bind -M visual \cF end-of-line
    bind -M insert \cF end-of-line

end
function fish_right_prompt
  set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
  date "+%Y-%m-%d %H:%M:%S"
  set_color normal
end
