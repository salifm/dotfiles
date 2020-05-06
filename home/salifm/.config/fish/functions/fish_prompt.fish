function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set_color normal
    set_color $fish_color_cwd
    echo "> ["$last_status"] "(pwd)
    echo -n '➤ '
    set_color normal
end
