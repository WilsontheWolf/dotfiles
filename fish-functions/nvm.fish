function nvm
    if not test -n "$NVM_DIR"
        echo NVM Not setup proper.
    end
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
