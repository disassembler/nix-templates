{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = {
    installeriso = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ../../nixos/installeriso/configuration.nix
      ];
      specialArgs = {
        inherit self inputs;
        system = "x86_64-linux";
      };
    };
  };
}
