# auxolotl/lib

<a href="https://forum.aux.computer/c/special-interest-groups/sig-core/14"><img src="https://img.shields.io/static/v1?label=Maintained%20By&message=SIG%20Core&style=for-the-badge&labelColor=222222&color=794AFF" /></a>

This repo contains system-agnostic library functions used by auxolotl repositories.

There are two main parts:

  - `stdlib` - mostly copied from Nixpkg's standard library. Meant to be forwards-compatible.
  - `auxlib` - library bits specifically for aux / auxpkgs. Not necessarily forwards-compatible.

## Testing

Tests are stored in `tests/<part>`. You can run them all with `nix-build tests/default.nix`, which will run them with the minimum and maximum supported nix versions.

Alternatively, if using flakes you can run `nix flake check`. This will also check formatting using `nixfmt`.

## Documentation

Reference documentation for library functions is written above each function as a multi-line comment.
These comments are processed using [nixdoc](https://github.com/nix-community/nixdoc), although currently we aren't doing much with the output.
The nixdoc README describes the [comment format](https://github.com/nix-community/nixdoc#comment-format).
