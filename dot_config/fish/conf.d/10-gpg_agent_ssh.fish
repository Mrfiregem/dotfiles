if status is-login
    set -e SSH_AGENT_PID
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh
end
