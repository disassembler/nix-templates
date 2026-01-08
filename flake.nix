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

    };

    defaultTemplate = self.templates.colmena;
  };
}
