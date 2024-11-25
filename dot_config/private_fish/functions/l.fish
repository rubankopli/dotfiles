function l --description 'List only the contents of directory (no details) using a single column'
    eza --oneline --group-directories-first --smart-group --icons=always --color-scale=all $argv
end
