function fish_prompt
    set -l prompt_status "$status"
    set -l user_char '>'
    if fish_is_root_user
        set user_char '#'
    end
    set -a user_char (set_color normal)
    set -a user_char " "

    set -l badges ""
    if test -n "$SSH_CONNECTION"
        set -a badges (set_color -o red)R
    end
    if test -n "$DISTROBOX_ENTER_PATH"
        set -a badges (set_color -o yellow)D
    end
    if test "$prompt_status" -ne 0
        if test -n "$badges"
            set -a badges " "
        end
        set -a badges (set_color -o red)$prompt_status
    end

    if test "$CMD_DURATION" -gt 2000 # 2 seconds
        if test -n "$badges"
            set -a badges " "
        end
        set -a badges (set_color -o magenta)$(pretty_dur $CMD_DURATION)
    end


    if test -n "$badges"
        set -a badges " "
    end

    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_char_upstream_ahead ↑
    set -g __fish_git_prompt_char_upstream_behind ↓
    set -g __fish_git_prompt_char_upstream_diverged ↑↓

    set -l git (fish_vcs_prompt "$(set_color normal):%s")
    set -l pre (string join '' --  $badges (set_color -o green) $USER @ (prompt_hostname) (set_color normal) :)
    set -l post (string join '' -- (set_color -o blue) (prompt_pwd --dir-length=0)) $git (set_color -o blue)


    set -l length (string length --visible -- "$pre$post")
    set -l oneline 1
    if test (math $COLUMNS - $length - 2) -lt 50
        set oneline 0
        if test (math $length + 4) -gt $COLUMNS
            set post (string join '' -- (set_color -o blue) (prompt_pwd --dir-length=2)) $git
            set length (string length --visible -- "$pre$post")
            if test (math $length + 4) -gt $COLUMNS
                set pre $badges
                set length (string length --visible -- "$pre$post")
                if test (math $length + 4) -gt $COLUMNS
                    set post (string join '' -- (set_color -o blue) (basename $PWD)) $git
                    set length (string length --visible -- "$pre$post")
                    if test (math $length + 4) -gt $COLUMNS
                        set post (string join '' -- (set_color -o blue) (basename $PWD))
                        set length (string length --visible -- "$pre$post")
                        if test (math $length + 4) -gt $COLUMNS
                            set oneline 1
                            set post (set_color -o blue)
                        end
                    end
                end
            end
        end
    end
    if test "$oneline" -eq 1
        string join '' -- $pre $post $user_char
    else
        string join '' -- (set_color blue) ┌ [ (set_color normal) $pre $post (set_color normal) (set_color blue) ]
        string join '' -- └ (set_color -o blue)$user_char
    end
end
