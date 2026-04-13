{
    description = "Python dev shell with venv and pip support (Qiskit-compatible, FHS)";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; };
        fhs = pkgs.buildFHSEnv {
            name = "fhs-shell";

            targetPkgs = pkgs: [
                (pkgs.python313.withPackages (ps: [ ]))
                pkgs.stdenv.cc.cc.lib
                pkgs.antlr
                pkgs.graphviz
                pkgs.xspim
            ];

            runScript = "fish";

            profile = ''
                if [ ! -d .venv ]; then
                    echo "Creating Python venv in .venv..."
                    python -m venv .venv
                fi
                source .venv/bin/activate
                echo "Virtual environment activated. You can now use pip freely."

                export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath [
                    pkgs.stdenv.cc.cc.lib
                ]}:$LD_LIBRARY_PATH

                export ANTLR=${pkgs.antlr}/bin/antlr
                export ANTLR_OPTIONS="-Dlanguage=Python3"
                export CPSC_411_LIB="./lib/antlr4/python3.13/"
                export PS1="avery.keuben>"
            '';
        };
    in {
        devShells.${system}.default = fhs.env;
    };
}

