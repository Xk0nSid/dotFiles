export VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT=' ${return_status} %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg[green]%}$(get_pwd)%{$reset_color%} $(git_prompt_info)
${prompt_suffix}'

RPROMPT='$(get_right_prompt)'

local return_status="%(?:%{$fg_bold[green]%}π:%{$fg_bold[red]%}π)%{$reset_color%}"

local prompt_suffix="%{$fg[magenta]%}❯%{$reset_color%} "

function get_right_prompt() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo -n "[%{$fg[cyan]%}$(git_prompt_short_sha)%{$reset_color%}] $(get_virtual_env_prompt)"
    else
        echo -n "%{$reset_color%} $(get_virtual_env_prompt)"
    fi
}

function get_virtual_env_prompt() {
    if (( ${+VIRTUAL_ENV} )); then
        VNAME=$(basename $(dirname $VIRTUAL_ENV))
        PYV=$($VIRTUAL_ENV/bin/python --version | cut -d ' ' -f2)
        echo -n "[%{$fg[green]%} %{$fg[magenta]%}$VNAME %{$fg[cyan]%}($PYV)%{$reset_color%}]"
    fi
}

# adapted from shashankmehta (https://github.com/shashankmehta)
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    # This shortens the path directory
    # if current directory is a git repo
    # parent=${git_root%\/*}
    # prompt_short_dir=${PWD#$parent/}

    # default full path
    prompt_short_dir=%~
  fi
  echo $prompt_short_dir
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
