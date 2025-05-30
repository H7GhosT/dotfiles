if status is-interactive
    load_nvm > /dev/stderr
    if not pgrep ssh-agent > /dev/null
        echo "Runnig 'ssh-agent -c' and setting necessary environment variables"
        eval (ssh-agent -c)
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    end

    if test -d $HOME/.local/bin
        set -gx PATH $HOME/.local/bin $PATH
    end
end

