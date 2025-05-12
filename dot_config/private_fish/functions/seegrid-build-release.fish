# Build & Test command:
# dm ./waf install_release --targets=multi-axis-pick-payload-behavior-unit-test && dm unit_test ./run-unittests.py -b debug multi-axis-pick-payload-behavior-unit-test

function seegrid-build-release --description 'Release build a given target or targets'
	dm ./waf install_release $argv
end 
