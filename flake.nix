{
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    outputs =
        { nixpkgs, ... }:
        let
            inherit (nixpkgs) lib;
            systems = lib.platforms.linux;
            forEachSystem = fn: lib.genAttrs systems (system: fn system nixpkgs.legacyPackages.${system});
        in
        {
            devShells = forEachSystem (
                system: pkgs:
                let
                    tealDeclarations =
                        pkgs.runCommand "teal_declarations"
                            {
                                src = pkgs.fetchurl {
                                    url = "https://gitlab.com/OpenMW/openmw/-/jobs/13631989749/artifacts/download";
                                    sha256 = "sha256-R9GGBz5uIRmIHj62MuAKY3+BHlpR1UpoLg24vSqH0Ck=";
                                };
                            }
                            ''
                                mkdir -p $out
                                mkdir -p temp
                                ${lib.getExe pkgs.unzip} $src -d temp

                                rm temp/teal_declarations/tlconfig.lua
                                mv temp/teal_declarations/* $out/
                            '';
                in
                {
                    default = pkgs.mkShell {
                        packages = with pkgs; [
                            luajitPackages.cyan
                        ];

                        TEAL_DECLARATIONS = tealDeclarations;
                    };
                }
            );
        };
}
