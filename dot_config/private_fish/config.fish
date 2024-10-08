if status is-interactive
    	# Commands to run in interactive sessions can go here
	
	# Exports

	## man config (configurations for man pages, not men)
	### Show percentage through document in less: "less -s -M +Gg"
	### 	source: https://stackoverflow.com/a/19871578/5353461
	### Show colors in man pages: "less -R --use-color -Dd+r -Du+b"
	###			    + "MANROFFOPT '-P -c'
	### 	source: https://wiki.archlinux.org/title/Color_output_in_console#man
	#set -xU MANPAGER 'less -s -M +Gg -R --use-color -Dd+r -Du+b'
	#set -xU MANROFFOPT '-P -c'

	## Used for colorization by some cli utilities including 'ip'
	### Light-Green Text ; Dark Purple Background [https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit]
	set -xU COLORFGBG "10;5"


	# Abbreviations (Different from aliases! Aliases should be placed in 'functions/')
	## Directories
	abbr --add ~c --position anywhere --set-cursor=_ "~/.config/_"
	## Git
	### Commands
	abbr --add gits --position command "git status"
	abbr --add gita --position command "git add . && git status"
	abbr --add gitc --position command --set-cursor=_ "git commit -m \"TAS-#### #comment _\""
	abbr --add gitct --position command "git commit -m "TAS-#### #time #h #comment "
	### Work specific
	abbr --add gch --position command --set-cursor=# "git checkout RKOPLI-TAS-#"
	



# end if  is-interactive	
end 
