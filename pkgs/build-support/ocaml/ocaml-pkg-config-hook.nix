{ makeSetupHook, ocaml, writeText }:

let
  hook = writeText "ocaml-pkg-config-hook.sh" ''
    addOcamlPkgConfigDir() {
      local pkg_config_dir

      pkgconfig_dir="''$1/lib/ocaml/${ocaml.version}/site-lib/pkgconfig"

      if test -d "$pkgconfig_dir"; then
        addToSearchPath PKG_CONFIG_PATH "$pkgconfig_dir"
      fi
    }

    addEnvHooks "$targetOffset" addOcamlPkgConfigDir
  '';
in
  makeSetupHook {
    name = "ocaml-pkg-config-hook";
  } hook
