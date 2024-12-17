{
  description = "My beloved";

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
          packages = with pkgs; [
            dotnet-sdk_8
            omnisharp-roslyn
          ];

          shellHook = ''
            dotnet --info
          '';
        };
    };
}
