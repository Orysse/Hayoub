{
  description = "https://cri.epita.fr/users/gollum/";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    stylix.url = "github:danth/stylix";
    impermanence.url = "github:nix-community/impermanence";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
  };

  outputs = inputs@{ home-manager, nixpkgs, impermanence, self, ... }: 
  let
    
    host = "Restau-kebab-DGSI";
    system = "x86_64-linux";
    inherit (import ./hosts/${host}/options.nix) username hostname;

    pkgs = import nixpkgs {
      inherit system;
      config = {
	    allowUnfree = true;
      };
    };
  in 
  {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
	    specialArgs = { 
          inherit system; inherit inputs; 
          inherit username; inherit hostname;
          inherit host; inherit pkgs;
        };
	    modules = [ 
        ./system.nix
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
            home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit host;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username} = import ./users/${username}/home.nix;
        }
        ];
      };
    };
  };
}
