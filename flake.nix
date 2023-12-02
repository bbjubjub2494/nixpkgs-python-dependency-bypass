{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages.default = with pkgs.python3Packages; buildPythonPackage {
          pname = "test";
          version = "1";
          src = ./.;
          format = "pyproject";

          buildInputs = [
            setuptools
            setuptools_scm
            pythonImportsCheckHook
          ];
        };
      };
    };
}
