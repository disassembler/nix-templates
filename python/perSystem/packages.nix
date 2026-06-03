{
  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    python = pkgs.python3;

    app = python.pkgs.buildPythonApplication {
      pname = "yourapp";
      version = "0.1.0";
      pyproject = true;

      src = lib.fileset.toSource {
        root = ./..;
        fileset = lib.fileset.unions [
          ../pyproject.toml
          ../src
        ];
      };

      build-system = with python.pkgs; [
        hatchling
      ];

      dependencies = with python.pkgs; [];

      meta = {
        mainProgram = "yourapp";
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
      inherit app;
    };

    packages = {
      default = app;
      yourapp = app;
    };
  };
}
