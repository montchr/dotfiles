eval "$(gpgconf --launch gpg-agent)"

# https://unix.stackexchange.com/questions/217737/pinentry-fails-with-gpg-agent-and-ssh
export GPG_TTY=`/usr/bin/tty`
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"