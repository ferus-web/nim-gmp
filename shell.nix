with import <nixpkgs> { };

mkShell {
  nativeBuildInputs = [
    pkg-config
    gmp
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath [
    gmp.dev
  ];
}
