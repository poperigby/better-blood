{
  description = "Teal build environment for openmw-better-blood";

  inputs = {
    devshell.url = "github:numtide/devshell";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        inputs.devshell.flakeModule
      ];

      perSystem =
        { pkgs, ... }:
        {
          devshells.default = {
            packages = with pkgs; [
              git
              luajitPackages.cyan
              luajitPackages.tl
            ];
          };
        };
    };

}
