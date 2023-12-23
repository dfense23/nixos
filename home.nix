{ config, pkgs, ... }:

{
  home.username = "dfense";
  home.homeDirectory = "/home/dfense";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "dfense";
    userEmail = "andreas@soulboarder.net";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your cusotm bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      # don't put duplicate lines in the history. See bash(1) for more options
	# ... or force ignoredups and ignorespace
	HISTCONTROL=ignoredups:ignorespace

	# append to the history file, don't overwrite it
	shopt -s histappend

	# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
	HISTSIZE=1000
	HISTFILESIZE=2000

	# check the window size after each command and, if necessary,
	# update the values of LINES and COLUMNS.
	shopt -s checkwinsize

	# make less more friendly for non-text input files, see lesspipe(1)
	[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";

      rp='resticprofile'

      # neovim
      vim="nvim"
      nv="nvim"
      vom="nvim"
      nvom="nvim"
      
      ls="ls --color=auto"
      ll="ls -lav --ignore=.."   # show long listing of all except ".."
      l="ls -lav --ignore=.?*"   # show long listing but no hidden dotfiles except "."
      e="exa -F"
      el="exa -l --icons -gHmhb"
      ela="exa -la --icons -gHmhb"
      et1="exa -T --level=1 --icons -gHmhb"
      et2="exa -T --level=2 --icons -gHmhb"
      et3="exa -T --level=3 --icons -gHmhb"
      et="exa -T --icons -gHmhb"
      etl1="exa -lT --level=1 --icons -gHmhb"
      etl2="exa -lT --level=2 --icons -gHmhb"
      etl3="exa -lT --level=3 --icons -gHmhb"
      etl="exa -lT --icons -gHmhb"
      
      #git aliases
      #gh="git log --pretty=format:"%h %ad | %s%d" --graph --date=short"
      gh="git log --graph --pretty=format:"%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %s""
      gha="git log --graph --pretty=format:"%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %s" --all"
      gs="git status "
      ga="git add "
      gb="git branch "
      gc="git commit"
      gd="git diff"
      gr="git rm"
      gco="git checkout "
      gty="git cat-file -t "
      gdu="git cat-file -p "
      got="git "
      get="git "
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
