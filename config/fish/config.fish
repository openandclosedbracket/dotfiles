if status is-interactive
    set fish_greeting
    starship init fish | source
    export PATH="$HOME/.local/bin:$PATH"
    alias clock='clocktemp'
    zoxide init fish | source

    function ls
        eza -l --all --extended --header --git --time-style=long-iso --group-directories-first $argv
    end

    function cd
        z $argv
    end
    # Commands to run in interactive sessions can go here
end
