function la --description 'List contents of directory with extended information'
    exa --long --all --all --header --group-directories-first --group --links --inode --mounts --numeric --blocksize --flags --modified --accessed --created --changed --git --git-repos --extended --icons=always --color-scale=all $argv
end
