{
  description = "The Alium Blog";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            hugo
            bun
          ];

          shellHook = ''
            # [ -d "$PWD/node_modules" ] || bun install
            while true; do
              hugo server -b http://localhost -p 8000 --disableFastRender
              sleep 1
            done
          '';
        };
      }
    );
}
