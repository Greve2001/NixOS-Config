let theme = import ../../theme;
in {

  programs.starship = {
    enable = true;

    settings = {
      format = ''
        $character$username$directory$git_branch$cmd_duration
        [❯ ](bold #${theme.primary-color})
      '';

      git_branch = {
        format =
          "[$symbol $branch(:$remote_branch) ](bold #${theme.primary-color})";
        symbol = "";
      };

      directory = {
        format = "󰉋 $path ";
        truncation_length = 3;
        truncate_to_repo = false;
      };

      character = {
        success_symbol = "";
        error_symbol = "[](bold #${theme.error-color})";
      };

      hostname = {
        ssh_only = false;
        ssh_symbol = "🌐";
        format = "[$ssh_symbol$hostame](bold #${theme.error-color})";
      };

      username = {
        style_root = "bold #${theme.root-color}";
        style_user = "bold #${theme.primary-color}";
        format = "[$user ](bold #${theme.primary-color})";
        show_always = true;
      };

      cmd_duration = {
        min_time = 1;
        format = "[[ ](fg: bold)$duration](fg: #${theme.weak-text-color})";
        disabled = false;
      };
    };
  };
}
