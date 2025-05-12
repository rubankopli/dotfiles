# Wraps two other custom fish functions

function seegrid-build-and-unit-test --description 'Debug builds and runs a given unit test target or targets'
	seegrid-build $argv && seegrid-unit-test $argv
end

