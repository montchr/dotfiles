# https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b
#
# In order for gpg to find gpg-agent, gpg-agent must be running, and there must be an env
# variable pointing GPG to the gpg-agent socket. This little script will either start
# gpg-agent or set up the GPG_AGENT_INFO variable if it's already running.

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval "$(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)"
fi

# https://unix.stackexchange.com/questions/217737/pinentry-fails-with-gpg-agent-and-ssh
export GPG_TTY=`tty`
