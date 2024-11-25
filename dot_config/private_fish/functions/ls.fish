function ls --description 'List contents of directory with exa'
    eza --group-directories-first --smart-group --git --icons=always --color-scale=all $argv
end
