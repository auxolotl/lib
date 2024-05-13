{ runCommand, nixfmt }:
runCommand "aux-lib-formatting" { buildInputs = [ nixfmt ]; } ''
  find ${../.} -iname '*.nix' -type f -print0 | xargs -0 -i nixfmt -c {}
  touch $out
''
