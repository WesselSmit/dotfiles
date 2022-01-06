# launch nvm on shell startup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use

  # use default node version if no .nvmrc is found
    # elif [[ $(nvm version) != $(nvm version default)  ]]; then
    #   default_node_version=v14
    #   echo "No .nvmrc found, using node version: $default_node_version"
    #   nvm use $default_node_version
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# launch gpg on shell startup (necessary for github user verification)
# also see https://gist.github.com/phortuin/cf24b1cca3258720c71ad42977e1ba57
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent


# make the 'code .' command work by globally exposing the PATH var
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# make 'flutter' command globally available
export PATH="$PATH:/Users/wesselsmit/flutter/bin"


# make zsh autocomplete case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'

