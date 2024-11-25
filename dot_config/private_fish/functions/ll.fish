function ll --description 'List contents of directory with details'
    eza --long --all --header --group-directories-first --smart-group --git --extended --icons=always --color-scale=all $argv
end
