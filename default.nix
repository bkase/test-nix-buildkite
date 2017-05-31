with import <nixpkgs> {};
pkgs.stdenv.mkDerivation rec {
  name = "test-nix-buildkite";
  # get deps
  buildInputs = [ ruby ];
  src = ./.;

  # test
  doCheck = true;
  checkPhase = ''
    ./test.rb
  '';

  # install it
  installPhase = ''
    mv src/hello.rb $out
  '';

  # run the command to check if it's installed
  doInstallCheck = true;
  installCheckPhase = ''
    $out
  '';
}

