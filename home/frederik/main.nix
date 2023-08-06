{ config, pkgs, ... }:

{
    imports = [
        # Fill later, when everything is moved to different files
    ];

    home.stateVersion = "23.05";

    programs = {
	# Git
        git = {
            enable = true;
            userName = "Greve2001";
            userEmail = "frederik.greve@gmail.com";
        };

        # Zsh
        zsh = {
            enable = true;
	    autocd = true;
      	    enableAutosuggestions = true;
      	    enableCompletion = true;
      	    enableSyntaxHighlighting = true;
      	    shellAliases = {
                icat="kitty +kitten icat";
                clip="kitty +kitten clipboard";
                ls="ls --color=auto";
                ip="ip -c";
            };
            history = {
                size = 10000;
            };
	    shellAliases = {
                update = "sudo nixos-rebuild switch";
                upgrade = "sudo nixos-rebuild switch --upgrade";
                clean = "sudo nix-collect-garbage"; 
            };
        };
		
        # Starship
        starship = {
            enable = true;
            settings = {
                format = ''
                    $character$username$directory$git_branch$cmd_duration
                    [❯ ](bold #89b4fa)
                '';

                git_branch = {
                    format = "[$symbol $branch(:$remote_branch) ](bold #89b4fa)";
                    symbol = "";
                };

                os.symbols = {
                    Arch = " ";
                    Linux = " ";
                };

                directory = {
                    format = "󰉋 $path ";
                    truncation_length = 3;
                    truncate_to_repo=false;
                };
                
                character = {
                    success_symbol = "";
                    error_symbol = "[](red bold)";
                };
                

                hostname = {
                    ssh_only = false;
                    ssh_symbol = "🌐";
                    format = "[$ssh_symbol$hostame](bold #89b4fa)";
                };
                
                username = {
                    style_root = "bold red";
                    style_user = "bold #89b4fa";
                    format = "[$user ](bold #89b4fa)";
                    show_always = true;
                };
                
                cmd_duration = {
                    min_time = 1;
                    format = "[[ ](fg:#eba0ac bold)$duration](fg:#BBC3DF)";
                    disabled = false;
                };
            };
        };
    };
}
