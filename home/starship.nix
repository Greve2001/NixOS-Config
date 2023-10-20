let
  cp = import ../color-palette.nix;
in
{

  programs.starship = {
    enable = true;

    settings = {
      format = ''
        $character$username$directory$git_branch$cmd_duration
        [❯ ](bold ${cp.primary-color})
      '';

      git_branch = {
        format = "[$symbol $branch(:$remote_branch) ](bold ${cp.primary-color})";
        symbol = "";
      };

      directory = {
        format = "󰉋 $path ";
        truncation_length = 3;
        truncate_to_repo = false;
      };

      character = {
        success_symbol = "";
        error_symbol = "[](bold ${cp.error-color})";
      };

      hostname = {
        ssh_only = false;
        ssh_symbol = "🌐";
        format = "[$ssh_symbol$hostame](bold ${cp.error-color})";
      };

      username = {
        style_root = "bold ${cp.root-color}";
        style_user = "bold ${cp.primary-color}";
        format = "[$user ](bold ${cp.primary-color})";
        show_always = true;
      };

      cmd_duration = {
        min_time = 1;
        format = "[[ ](fg: bold)$duration](fg: ${cp.weak-text-color})";
        disabled = false;
      };
    };
  };
}

