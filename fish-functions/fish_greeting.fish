function fish_greeting
    if type -q fortune; and type -q cowsay 
        fortune | cowsay -n
    end
end
