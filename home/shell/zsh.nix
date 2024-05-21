{ config, lib, pkgs, ... }: 

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
	"thefuck" 
	];
      theme = "duellj";
    };

    plugins = [
            ];

    initExtra = ''
      eval $(thefuck --alias)
      eval $(zoxide init zsh)
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";

      rp="resticprofile";

      # neovim
      vim="nvim";
      nv="nvim";
      vom="nvim";
      nvom="nvim";
      
      ls="ls --color=auto";
      ll="ls -lav --ignore=..";   # show long listing of all except "..";
      l="ls -lav --ignore=.?*";   # show long listing but no hidden dotfiles except ".";
      e="exa -F";
      el="exa -l --icons -gHmhb";
      ela="exa -la --icons -gHmhb";
      et1="exa -T --level=1 --icons -gHmhb";
      et2="exa -T --level=2 --icons -gHmhb";
      et3="exa -T --level=3 --icons -gHmhb";
      et="exa -T --icons -gHmhb";
      etl1="exa -lT --level=1 --icons -gHmhb";
      etl2="exa -lT --level=2 --icons -gHmhb";
      etl3="exa -lT --level=3 --icons -gHmhb";
      etl="exa -lT --icons -gHmhb";
      cs="cowsay";
      
      #nixos aliases
      nrsf="sudo nixos-rebuild switch --flake .#";
      #git aliases
      #gh="git log --pretty=format:"%h %ad | %s%d" --graph --date=short"
      ghi="git log --graph --pretty=format:'%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %s'";
      ghia="git log --graph --pretty=format:'%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %s' --all";
      gs="git status ";
      ga="git add ";
      gb="git branch ";
      gc="git commit";
      gd="git diff";
      gr="git rm";
      gco="git checkout ";
      gty="git cat-file -t ";
      gdu="git cat-file -p ";
      got="git ";
      get="git ";
    };
  };
}
