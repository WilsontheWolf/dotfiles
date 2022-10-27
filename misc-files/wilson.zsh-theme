PROMPT='$(
[[ $SSH_CONNECTION != "" ]] && badge="%{$fg_bold[red]%}R %{$reset_color%}"
pr="$badge%{%B$fg[green]$B%}%n@%m%{$reset_color%}:%{$fg[blue]%B%}%~"
if [ $(($(tput cols)-$(pwd|sed -e "s/\/home\/.*\/?/~/g"|wc -c))) -lt $((40)) ]; then
    echo "%{$fg[blue]%B%}┌["$pr"]\n└>%{$reset_color%} " 
else echo ""$pr">%{$reset_color%} "
fi)'
