{
  description = "A Nix-flake-based Jupyter development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      devShells."${system}".default =
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        pkgs.mkShell {
          venvDir = ".venv";
          packages =
            with pkgs;
            [
              poetry
              python3
            ]
            ++ (with python3Packages; [
              ipykernel
              pip
              venvShellHook
            ]);

          shellHook = ''
            python --version
          '';
        };
    };
}
