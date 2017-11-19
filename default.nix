{ pkgs ? import <nixpkgs> {}
}:

{
  tarball = pkgs.fetchzip {
    url = https://github.com/johbo/reproduce-nix-unicode-darwin/archive/9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz;
    sha256 = "1h7z2wax8ywhp0zr08qm78573rcd6nq3y8scl5pbv3lhpilf44sr";
  };

  other = pkgs.stdenv.mkDerivation {
    name = "nix-issue-847-reproduce";
    src = ./src;
    installPhase = ''
      mkdir -p $out
      cp -rv reproduce $out/
    '';
  };
}
