# Build & Test command:
# dm ./waf install_debug --targets=multi-axis-pick-payload-behavior-unit-test && dm unit_test ./run-unittests.py -b debug multi-axis-pick-payload-behavior-unit-test

function seegrid-build --description 'Debug build a given target or targets'
	dm ./waf install_debug --targets=$argv
end 
