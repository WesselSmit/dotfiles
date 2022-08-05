# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"


# launch nvm on shell startup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use

  # use default node version if no .nvmrc is found
    elif [[ $(nvm version) != $(nvm version default)  ]]; then
      default_node_version=v14
      echo "No .nvmrc found, reverting to default node version"
      nvm use $default_node_version
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


# git aliases
alias ga="git add"
alias gaa="git add ."
alias gf="git fetch"
alias gs="git status"
alias gpl="git pull"
alias gps="git push"
alias gpsu="git push -u origin HEAD"
alias gb="git branch"
alias gbd="git branch -D"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout main"
alias gcop="git switch -"
alias gst="git stash -u -m"
alias gstl="git stash list"
alias gstp="git stash pop"


# npm aliases
alias nr="npm run"
alias ni="npm install"
alias nci="npm clean-install"
alias nd="npm install -D"
alias nu="npm uninstall"


# zsh automcompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
