function ls --description 'List contents of directory with tree view'
    exa --long --all --header --tree --level 2 --group-directories-first --smart-group --git --extended --icons=always --color-scale=all $argv
end
