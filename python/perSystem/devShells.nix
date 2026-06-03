{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = with pkgs;
      mkShell {
        packages = [
          python3
          python3Packages.pip
          ruff
          pyright
          config.treefmt.build.wrapper
        ];
      };
  };
}
