{
  self,
  config,
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  deployment = {
    targetHost = "0.0.0.0";
    targetPort = 22;
    targetUser = "root";
  };
}
