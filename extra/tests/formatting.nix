{ auxlib, runCommand, nixfmt }:
runCommand "aux-lib-formatting" { buildInputs = [ nixfmt ]; } ''
  find ${auxlib} -iname '*.nix' -type f -print0 | xargs -0 -i nixfmt -c {}
  touch $out
''
