{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      manifest = (pkgs.lib.importTOML ./Cargo.toml).package;
    in
    {
      packages.${system}.default = pkgs.rustPlatform.buildRustPackage {
        pname = manifest.name;
        version = manifest.version;
        src = ./.;

        cargoLock = {
          lockFile = ./Cargo.lock;
        };

        # nativeBuildInputs = with pkgs; [];

        # buildInputs = with pkgs; [];
      };

      apps.${system}.default = {
        type = "app";
        program = "${self.packages.${system}.default}/bin/${manifest.name}";
      };

      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          cargo
          rust-analyzer
          rustfmt
          rustPackages.clippy
        ];

        # shellHook = ''
        # '';
      };
    };
}
