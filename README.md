# CPSC-411 Project

This is the repo for my project for CPSC-411. 

## Building

To build the project, you must first generate required grammar files from ANTLR4. A make file has been provided to do this 
automatically.

```
make
```

To clean up generated files, use 

```
make clean
```

## Running 
After building, you can lex a given input file using 
```
python main.py input.j--
```
or simply:
```
./main.py input.j--
```

## Testing
Run the included test suite using
```
make test
```

## Repo Layout 
The test system is entirely self contained within the `test` directory.

Grammer files for the lexer are provided in the `grammar` directory.

Python source files, including logging utilities and lexer management are in the 
- `src/core`
- `src/lex`
directories respectively.

The main file is located at the root of the repo to align with project specifications.

The `flake.nix`, `shell.nix`, and `.envrc` files are useful to allow for building and running the project on a different system that has Nix or NixOS installed.
