# return the names of git branches in the current project without the currently selected branch

_git_branches() {
  COMPREPLY=("x.com" "x.io")
  return 0
}
