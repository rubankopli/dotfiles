function seegrid-build-compile-commands --description 'Build compile commands used for clang/clangd using waf, and replace all /checkout/src lines with current path. Must be run from blue root directory'
    dm build ./waf clangdb
    dm build ./waf clangdb_debug
    perl -i.bak -pe "s/\/checkout\/src/$pwd/g" build/compile_commands.json
    perl -i.bak -pe "s/\/checkout\/src/$pwd/g" build/debug/compile_commands.json
end
