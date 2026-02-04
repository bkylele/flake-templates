{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      eachSystem = lib.genAttrs lib.systems.flakeExposed;
      pkgs = eachSystem (system: import nixpkgs { inherit system; });
    in
    {
      devShells = eachSystem (system: {
        default = pkgs.${system}.mkShell {
          packages = with pkgs.${system}; [
            # gcc
          ];
        };
      });
    };
}
