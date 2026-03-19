{inputs, ...}: {
  perSystem = {
    config,
    pkgs,
    inputs',
    ...
  }: {
    devShells.default =
      pkgs.mkShell
      {
        packages = with pkgs; [
          wireguard-tools
          jq
          age
          ssh-to-age
          pwgen
          just
          nushell
          inputs'.colmena.packages.colmena
          inputs'.disko.packages.disko
          inputs'.sops-nix.packages.sops-import-keys-hook
          inputs'.sops-nix.packages.ssh-to-pgp
          inputs'.sops-nix.packages.sops-init-gpg-key
          config.treefmt.build.wrapper
        ];
      };
  };
}
