function ls --description 'List contents of directory with exa'
    exa --group-directories-first --smart-group --git --icons=always --color-scale=all $argv
end
