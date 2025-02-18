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

    ## ls colorization
    set --global --export LS_COLORS "$(vivid generate molokai)"

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
    abbr --add ~r --position anywhere --set-cursor=_ "~/repos/_"
    abbr --add ~s --position anywhere --set-cursor=_ "~/repos/seegrid/_"

    ## cd 
    ### (cd abbreviations removed in favor of using zoxide (`z`))

    ## Git
    ### Commands
    abbr --add gita --position command "git add . && git status"
    abbr --add gitb --position command "git branch"
    abbr --add gitspull --position command "git pull && git submodule sync --recursive && git submodule update --init --recursive"
    ### Format Helpers
    abbr --add gitqlog --position command "git log --pretty=format:\"%h %C(cyan)%cr%Creset %Cgreen%s %Cred%d%Creset\""
    abbr --add gittree --position command "git log --graph --decorate --pretty=oneline --abbrev-commit --branches"
    # TODO: Change below to a function to auto-populate ticket number based on branch name
    abbr --add gitc --position command --set-cursor=_ "git commit -m \"TAS-_\""
    abbr --add gitch --position command --set-cursor=# "git checkout rkopli/#-TAS-"
    abbr --add gitct --position command "git commit -m "TAS-#### #time #h #comment "
    abbr --add gits --position command "git status"



    ## Seegrid DM Tool
    abbr --add dme --position command --set-cursor=_ "dm exec build _"
    abbr --add dmb --position command "dm ./waf install_debug --targets=vsm"
    abbr --add dmbp --position command "dm ./waf install_release"
    abbr --add dmt --position command --set-cursor=# "dm unit_test ./run-unittests.py #"
    abbr --add dmp --position command --set-cursor=# "dm --entrypoint-tty platinum python -u ./util/platinum/PlatinumTestVsm.py --delete-path-db --tests test_#.py --body-types lift-series-1-106in,cab-reach-1-200in"
    abbr --add dmp-vsm --position command --set-cursor=# "dm  --entrypoint-tty platinum util/platinum/PlatinumTestVsm.py --tests #.py --body-types seegrid"
    abbr --add dmbt --position command --set-cursor=# "dm ./waf install_release && dm unit_test ./run-unittests.py #"
    abbr --add dmu --position command --set-cursor=# "dm unit_test ./run-unittests.py -b debug test-#"


    # end if  is-interactive	
end
