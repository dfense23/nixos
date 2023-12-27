{config, ...}: {
programs.tmux = {
  enable = true;
  clock24 = true;
  shortcut = " ";
  extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
# Change the prefix key to C-Space
    unbind C-b
    set -g prefix C-Space
    bind C-Space send-prefix

# Reload config with r
    unbind r

# neovim recommendations
    bind r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"
    set-option -g focus-events on
    set-option -g default-terminal "screen-256color"
    set-option -sa terminal-features ",screen:RGB"

# v and h are not bound by default, but we never know in the next versions...
    unbind v
    unbind h

    unbind % # Split vertically
    unbind """ # Split horizontally

    bind v split-window -h -c "#{pane_current_path}"
    bind h split-window -v -c "#{pane_current_path}"

# more history
    set -g history-limit 100000

# Alt-n for next window, Alt-e for previous (colemak adapted vim keybindings)
    bind -n M-e previous-window
    bind -n M-n next-window

# Copy mode
    set-window-option -g mode-keys vi
    set-option -sg escape-time 10
##############
### DESIGN ###
##############

# panes
    set -g pane-border-style fg=black
    set -g pane-active-border-style fg=red

## Status bar design
# status line
    set -g status-justify left
#set -g status-bg default
    set -g status-style fg=blue
    set -g status-interval 2

# messaging
    set -g message-command-style fg=blue,bg=black

# window mode
    setw -g mode-style bg=green,fg=black

# window status
    setw -g window-status-format " #F#I:#W#F "
    setw -g window-status-current-format " #F#I:#W#F "
    setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=white] #W "
    setw -g window-status-current-format "#[bg=brightmagenta]#[fg=white] #I #[fg=white]#[bg=cyan] #W "
    setw -g window-status-current-style bg=black,fg=yellow,dim
    setw -g window-status-style bg=green,fg=black,reverse

# loud or quiet?
    set -g visual-activity off
    set -g visual-bell off
    set -g visual-silence off
    set-window-option -g monitor-activity off
    set -g bell-action none

# The modes 
    set-window-option -g clock-mode-colour red
    set-window-option -g mode-style fg=red,bg=black,bold

# The panes 
    set -g pane-border-style bg=black,fg=black
    set -g pane-active-border-style fg=blue,bg=black
# set -g pane-active-border-style fg=black,bg=black

# The statusbar 
    set -g status-position bottom
    set -g status-style bg=black,fg=yellow,dim
    set -g status-left ""
    set -g status-right "#{?client_prefix,#[fg=white]#[bg=red]#[bold] - PREFIX - ,#[fg=brightwhite]#H}"

    set -g status-right-length 50
    set -g status-left-length 20

# The window
    set-window-option -g window-status-current-style fg=red,bg=black,bold
    set-window-option -g window-status-current-format " #I#[fg=brightwhite]:#[fg=brightwhite]#W "

    set-window-option -g window-status-style fg=magenta,bg=black,none
    set-window-option -g window-status-format " #I#[fg=brightblack]:#[fg=brightblack]#W#[fg=black]#F "

    set-window-option -g window-status-bell-style fg=white,bg=red,bold

# The messages 
    set -g message-style fg=white,bg=red,bold


### END DESIGN ###

    set -g @continuum-restore "on"
    set -g @continuum-boot "on"

# List of plugins
    set -g @plugin "tmux-plugins/tpm"
    set -g @plugin "tmux-plugins/tmux-sensible"
#set -g @plugin "jaclu/tmux-menus"
#set -g @plugin "ofirgall/tmux-window-name"
    set -g @plugin "tmux-plugins/tmux-resurrect"
    set -g @plugin "tmux-plugins/tmux-continuum"
#set -g @treemux-tree-nvim-init-file "~/.tmux/plugins/treemux/configs/treemux_init.lua"
#set -g @plugin "kiyoon/treemux"
    set -g @plugin "noscript/tmux-mighty-scroll"
    set -g @plugin "laktak/extrakto"
    set -g @extracto_key "e"
# Other examples:
# set -g @plugin "github_username/plugin_name"
# set -g @plugin "github_username/plugin_name#branch"
# set -g @plugin "git@github.com:user/plugin"
# set -g @plugin "git@bitbucket.com:user/plugin"

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    run "~/.tmux/plugins/tpm/tpm"
    '';
    };
    }


