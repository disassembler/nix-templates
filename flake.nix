{
  description = "Sam's Nix templates";

  outputs = { self }: {
    templates = {
      colmena = {
        path = ./colmena;
        description = "Colmena deployment with flake-parts";
        welcomeText = ''
          # Colmena Template Initialized
          
          Structure:
          - `perSystem/`: Package, DevShell, and Formatter definitions.
          - `flake/`: Overlays, Modules, and Library functions.
          - `nixos/`: System configurations
          
          Next steps:
          1. Run `nix develop` to enter the shell.
          2. Add your nixos configurations and link them in `flake/colmena.nix`
          3. Happy hacking!
        '';
      };
      rust = {
        path = ./rust;
        description = "Rust development with flake-parts";
        welcomeText = ''
          # Rust Template Initialized

          Structure:
          - `perSystem/`: Package, DevShell, and Formatter definitions.
          - `flake/`: Overlays, Modules, and Library functions.

          Next steps:
          1. Run `nix develop` to enter the shell.
          2. Update `Cargo.toml` and `flake.nix` with your project name.
          3. Happy hacking!
        '';
      };
      python = {
        path = ./python;
        description = "Python development with flake-parts";
        welcomeText = ''
          # Python Template Initialized

          Structure:
          - `perSystem/`: Package, DevShell, and Formatter definitions.
          - `flake/`: Overlays, Modules, and Library functions.
          - `src/yourapp/`: Python package source.

          Next steps:
          1. Run `nix develop` to enter the shell.
          2. Update `pyproject.toml` and `flake.nix` with your project name.
          3. Happy hacking!
        '';
      };
      elm = {
        path = ./elm;
        description = "Elm development with flake-parts";
        welcomeText = ''
          # Elm Template Initialized

          Structure:
          - `perSystem/`: Package, DevShell, and Formatter definitions.
          - `flake/`: Overlays, Modules, and Library functions.
          - `src/`: Elm source files.

          Next steps:
          1. Run `nix develop` to enter the shell.
          2. Update `elm.json` and `flake.nix` with your project name.
          3. Run `elm2nix convert > elm-packages.nix && elm2nix snapshot`.
          4. Run `nix build` to compile to result/index.html.
          5. Run `elm-live src/Main.elm` for a live-reload dev server.
          6. Happy hacking!
        '';
      };

    };

    defaultTemplate = self.templates.colmena;
  };
}
