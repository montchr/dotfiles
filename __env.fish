set -x EDITOR emacsclient

# enhancd
set -x ENHANCD_DISABLE_DOT 1
set -x ENHANCD_DISABLE_HYPHEN 1

# Git
set -x GIT_EDITOR 'emacsclient'
# This can be overridden on a per-project basis using direnv
set -x GIT_PRIMARY_BRANCH 'main'
set -x SCMPUFF_GIT_CMD (which hub)

# GPG
# https://unix.stackexchange.com/questions/217737/pinentry-fails-with-gpg-agent-and-ssh
set -x GPG_TTY '/usr/bin/tty'
set -x SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"

# Micro editor
set -x MICRO_TRUECOLOR 1

# SND
set -x SND "$HOME/Music/0-sounds-0"
set -x SNDS "$HOME/Music/0-sounds-0/-- samples --"
set -x SNDBACKUPS "$HOME/Music/0-sounds-0/--- backup ---"
