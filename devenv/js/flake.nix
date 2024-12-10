{
  description = "Help me";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      overlays.default = final: prev: rec {
        nodejs = prev.nodejs;
        yarn = (prev.yarn.override { inherit nodejs; });
      };

      devShells."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ self.overlays.default ];
          };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            node2nix
            nodejs
            nodePackages.pnpm
            yarn
          ];

          shellHook = ''
            node --version
          '';
        };
    };
}
