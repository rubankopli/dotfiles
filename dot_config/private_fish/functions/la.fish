function la --description 'List contents of directory with extended information'
    eza --long --all --all --header --group-directories-first --group --links --inode --mounts --blocksize --flags --modified --accessed --created --changed --git --git-repos --extended --icons=always --color-scale=all $argv
end
