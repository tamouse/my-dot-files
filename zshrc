# -*- mode: shell-script -*-

if [ -f "$HOME/.my-dot-files/zshrc.d/zsh-git-prompt/zshrc.sh" ] ; then
  source "$HOME/.my-dot-files/zshrc.d/zsh-git-prompt/zshrc.sh"
  PROMPT='%B%m%~%b$(git_super_status) %# '
fi