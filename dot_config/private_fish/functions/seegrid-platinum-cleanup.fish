# Platinum Test Command  dm --entrypoint-tty platinum python -u ./util/platinum/PlatinumTestVsm.py
# --delete-path-db --tests $(fd "test.*drop.*\.py" --base-directory util/platinum/test_VSM)
# --body-types cab-reach-1-200in

function seegrid-platinum-cleanup --description 'Clean up platinum artifacts that may impact tests'
	rm -rf ../Paths/ ../ConfHistory/ ../Elms/ ../FakeUsb/ ../Station* ../Upload/ util/platinum/BackupConfiguration.tar conf/LocalConfiguration.xml .restore-in-progress
	dm down
end 
