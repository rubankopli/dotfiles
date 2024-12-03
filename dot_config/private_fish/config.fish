if status is-login

	# Directory Setup

	# Create wafcache directory if one does not already exist (waf build cache)
	# We will then export an environment variable pointing to this
	if not test -d "$HOME/.cache/waf"
		mkdir $HOME/.cache/waf
	end

	# Exports

	## Add user's private bin to the path, if it exists
	if test -d "$HOME/.local/bin"
		fish_add_path $HOME/.local/bin
	end


# end status is-login
end

if status is-interactive
    	# Commands to run in interactive sessions can go here

	
	# Exports

	## Add to PATH
	### Add seegrid docker-test build-configs repo folder
	fish_add_path $HOME/repos/seegrid/docker-test/build-configs

	## Add environment variables
	## Add wafcache environment variables
	set --global --export WAFCACHE $HOME/.cache/waf
	set --global --export WAFLNCACHE $HOME/.cache/waf
	set --global --export WAFCACHE_DIR_FOR_DOCKER $HOME/.cache/waf


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
	abbr --add gita --position command "git add . && git status"
	abbr --add gitb --position command "git branch"
	# TODO: Change below to a function to auto-populate ticket number based on branch name
	abbr --add gitc --position command --set-cursor=_ "git commit -m \"TAS-_ #comment \""
	abbr --add gitch --position command --set-cursor=# "git checkout RKOPLI-TAS-#"
	abbr --add gitct --position command "git commit -m "TAS-#### #time #h #comment "
	abbr --add gits --position command "git status"
	
	## Seegrid DM Tool
	abbr --add dme --position command --set-cursor=_ "dm exec build _"


# end if  is-interactive	
end 
