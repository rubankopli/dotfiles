# Build/Test command:
# dm ./waf install_debug --targets=multi-axis-pick-payload-behavior-unit-test && dm unit_test ./run-unittests.py -b debug multi-axis-pick-payload-behavior-unit-test

function seegrid-unit-test --description 'Run unit tests on a given target or targets assuming they have been built with a debug build'
	dm unit_test ./run-unittests.py -b debug $argv
end
 
