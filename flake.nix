{
    description = "Python dev shell with venv and pip support (Qiskit-compatible)";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
    in {
        devShells.${system}.default = pkgs.mkShell {
            packages = [
                (pkgs.python312.withPackages (ps: [ ]))
                pkgs.stdenv.cc.cc.lib      # provides libstdc++.so.6
            ];

            shellHook = let 
                runtimeLibraries = [
                    pkgs.stdenv.cc.cc.lib      # provides libstdc++.so.6
                ];
            in ''
                if [ ! -d .venv ]; then
                  echo "Creating Python venv in .venv..."
                  python -m venv .venv
                fi
                source .venv/bin/activate
                echo "Virtual environment activated. You can now use pip freely."
                export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath runtimeLibraries}:$LD_LIBRARY_PATH
            '';
        };
    };
}

