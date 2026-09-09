{
  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    elmApp = pkgs.stdenv.mkDerivation {
      pname = "yourapp";
      version = "0.1.0";

      src = lib.fileset.toSource {
        root = ./..;
        fileset = lib.fileset.unions [
          ../elm.json
          ../elm-packages.nix
          ../registry.dat
          ../src
        ];
      };

      nativeBuildInputs = with pkgs; [
        elmPackages.elm
      ];

      # After updating elm.json, regenerate both files:
      #   elm2nix convert > elm-packages.nix
      #   elm2nix snapshot
      configurePhase = pkgs.elmPackages.fetchElmDeps {
        elmPackages = import ../elm-packages.nix;
        elmVersion = "0.19.1";
        registryDat = ../registry.dat;
      };

      buildPhase = ''
        export HOME=$TMPDIR
        rm -rf elm-stuff
        elm make src/Main.elm --optimize --output=$out/index.html
      '';

      installPhase = ''
        mkdir -p $out
      '';

      meta = {
        maintainers = with lib.maintainers; [
          disassembler
        ];
        license = with lib.licenses; [
          asl20
        ];
      };
    };
  in {
    checks = {
      inherit elmApp;
    };

    packages = {
      default = elmApp;
      yourapp = elmApp;
    };
  };
}
