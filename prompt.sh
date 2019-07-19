find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='*'
  else
    git_dirty=''
  fi
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

# export PS1="\[$txtcyn\][\u] \[$txtylw\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\n\[$txtgrn\]大哥，有何吩咐? \[$txtrst\]"
# export PS1="\[$txtcyn\][\u] \[$txtylw\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\n\[$txtgrn\]$ \[$txtrst\]"
export PS1="\[$txtlbl\][\D{%F %T}]\[$txtrst\] \[$txtcyn\][\u]\[$txtrst\] \[$txtylw\]\w\[$txtrst\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n\[$txtgrn\]$ \[$txtrst\]"

# Default Git enabled prompt with dirty state
# export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Another variant:
# export PS1="\[$bldgrn\]\u@\h\[$txtrst\] \w \[$bldylw\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\$ "

# Default Git enabled root prompt (for use with "sudo -s")
# export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
