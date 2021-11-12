# launch nvm on shell startup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# launch gpg on shell startup (necessary for github user verification)
# also see https://gist.github.com/phortuin/cf24b1cca3258720c71ad42977e1ba57
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

# make the 'code .' command work by globally exposing the PATH var
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# make zsh autocomplete case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'
