{ pkgs ? import <nixpkgs> { } // {
  lib = throw
    "pkgs.lib accessed, but the lib tests should use nixpkgs' lib path directly!";
} }:
pkgs.symlinkJoin {
  name = "nixpkgs-lib-tests";
  paths =
    [ (import ./stdlib { inherit pkgs; }) (import ./auxlib { inherit pkgs; }) ];
}
