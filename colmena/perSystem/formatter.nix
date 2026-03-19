{
  perSystem = {config, ...}: {
    treefmt = {
      projectRootFile = "flake.nix";

      programs.alejandra.enable = true;
      programs.taplo.enable = true;
      programs.prettier.enable = true;

      settings.global.excludes = [
        "*.lock"
        "*.patch"
        ".gitattributes"
        ".gitignore"
        ".gitmodules"
        "LICENSE"
      ];

      settings.formatter.prettier = {
        includes = ["*.md" "*.yml" "*.yaml"];
      };
    };

    formatter = config.treefmt.build.wrapper;
  };
}
