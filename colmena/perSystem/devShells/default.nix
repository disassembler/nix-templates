{inputs, ...}: {
  perSystem = {
    config,
    system,
    pkgs,
    lib,
    ...
  }: {
    devShells.default =
      pkgs.mkShell
      {
        nativeBuildInputs = let
          inherit (inputs.sops-nix.packages."${system}") sops-import-keys-hook ssh-to-pgp sops-init-gpg-key;
        in
          with pkgs; [
            wireguard-tools
            jq
            age
            ssh-to-age
            pwgen
            just
            nushell
            inputs.colmena.packages.${system}.colmena
            inputs.disko.packages.${system}.disko
            sops-import-keys-hook
            ssh-to-pgp
            sops-init-gpg-key
            config.treefmt.build.wrapper
          ];
      };
  };
}
