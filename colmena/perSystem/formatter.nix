{
  perSystem = {config, ...}: {
    treefmt = {
      projectRootFile = "flake.nix";
      programs.alejandra.enable = true;
      settings.global.excludes = [
        "*.lock"
        "*.patch"
        "package-lock.json"
        "go.mod"
        "go.sum"
        ".gitattributes"
        ".gitignore"
        ".gitmodules"
        "LICENSE"
      ];
      settings.formatter.alejandra = {
        includes = ["**/*.nix"];
      };
      programs.prettier.enable = true;
      settings.formatter.prettier = {
        includes = ["*.md" "*.yml" "*.yaml"];
      };
    };

    formatter = config.treefmt.build.wrapper;
  };
}
