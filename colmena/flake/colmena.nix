{
  self,
  inputs,
  config,
  lib,
  ...
}: {
  flake.colmena = {
    meta = {
      nixpkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
      };
      specialArgs.inputs = inputs;
      specialArgs.self = self;
    };
    server = {...}: {
      imports = [
        ../nixos/server/configuration.nix
        ../nixos/server/hardware-configuration.nix
      ];
    };
  };
  flake.colmenaHive = inputs.colmena.lib.makeHive self.outputs.colmena;
}
