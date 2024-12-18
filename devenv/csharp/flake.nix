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
          buildInputs = with pkgs; [
            dotnet-sdk_8
            omnisharp-roslyn
          ];
        in
        pkgs.mkShell {
          inherit buildInputs;
          name = "dotnet-env";
          shellHook = ''
            dotnet --info
            export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath buildInputs}
            export PATH=${pkgs.dotnet-sdk_8}/bin:$PATH
            export DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
          '';
        };
    };
}
