{ lib, options, ... }:
let
  discardPositions = lib.mapAttrs (k: v: v);
  # unsafeGetAttrPos is unspecified best-effort behavior, so we only want to consider this test on an evaluator that satisfies some basic assumptions about this function.
in assert builtins.unsafeGetAttrPos "a" { a = true; } != null;
assert builtins.unsafeGetAttrPos "a" (discardPositions { a = true; }) == null; {
  imports = [{
    options.imported.line8 = lib.mkOption { type = lib.types.int; };

    # Simulates various patterns of generating modules such as
    # programs.firefox.nativeMessagingHosts.ff2mpv. We don't expect to get
    # line numbers for these, but we can fall back on knowing the file.
    options.generated =
      discardPositions { line14 = lib.mkOption { type = lib.types.int; }; };

    options.submoduleLine16.extraOptLine16 = lib.mkOption {
      default = 1;
      type = lib.types.int;
    };
  }];

  options.nested.nestedLine22 = lib.mkOption { type = lib.types.int; };

  options.submoduleLine24 = lib.mkOption {
    default = { };
    type = lib.types.submoduleWith {
      modules = [
        ({ options, ... }: { options.submodDeclLine28 = lib.mkOption { }; })
        { freeformType = with lib.types; lazyAttrsOf (uniq unspecified); }
      ];
    };
  };

  config = {
    submoduleLine24.submodDeclLine28 =
      (options.submoduleLine24.type.getSubOptions
        [ ]).submodDeclLine28.declarationPositions;
  };
}
