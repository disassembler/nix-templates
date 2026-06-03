{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    treefmt = {
      projectRootFile = "flake.nix";

      programs.alejandra.enable = true;
      programs.ruff-format.enable = true;

      settings.global.excludes = [
        "*.lock"
        ".gitattributes"
        ".gitignore"
        ".gitmodules"
        "LICENSE"
      ];
    };

    formatter = config.treefmt.build.wrapper;
  };
}
