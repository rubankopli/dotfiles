# Platinum Test Command  dm --entrypoint-tty platinum python -u ./util/platinum/PlatinumTestVsm.py
# --delete-path-db --tests $(fd "test.*drop.*\.py" --base-directory util/platinum/test_VSM)
# --body-types cab-reach-1-200in

function seegrid-platinum-test --description 'Run platinum tests'
	seegrid-platinum-cleanup && \
	clear && \
	dm --entrypoint-tty platinum python -u ./util/platinum/PlatinumTestVsm.py $argv
end 
