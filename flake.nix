{
  description = "The flake configuration of my NixOS machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nur,
      ...
    }:
    {
      nixosConfigurations = {

        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            nur.modules.nixos.default
            ./configuration.nix
          ];
        };
      };
    };
}
