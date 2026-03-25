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
                system: pkgs: {
                    default = pkgs.mkShell {
                        packages = with pkgs; [
                            luajitPackages.cyan
                        ];
                    };
                }
            );
        };
}
