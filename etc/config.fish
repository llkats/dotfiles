doge

set -xU ES_MIN_MEM 256m
set -xU ES_MAX_MEM 1g

set PATH /usr/local/bin $PATH

# nvm bash alias
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# initial source for shell startup
bass source ~/.nvm/nvm.sh --no-use ';' nvm

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_status_symbol
  set -l git_status (git status --porcelain ^/dev/null)
  if test -n "$git_status"
    # Is there anyway to preserve newlines so we can reuse $git_status?
    if git status --porcelain ^/dev/null | grep '^.[^ ]' >/dev/null
      echo '*' # dirty
    else
      echo '#' # all staged
    end
  else
    echo    '' # clean
  end
end

function _remote_hostname
  if test -n "$SSH_CONNECTION"
    echo (whoami)@(hostname|cut -d . -f 1)
  end
end

function _full_prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
  if test "$PWD" != "$HOME"
    printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
  else
    echo '~'
  end
end

function fish_prompt
  set -l cyan (set_color cyan)
  set -l orange (set_color f5946e)
  set -l hotpink (set_color ff0080)
  set -l mintgreen (set_color a7d1a9)

  set -l normal (set_color normal)

  set -l cwd $cyan(_full_prompt_pwd)
  set -l git_status (_git_branch_name)(_git_status_symbol)

  if test -n "$git_status"
    set git_status " $git_status"
  end

  echo -n (_remote_hostname) $cwd $normal'('$orange$git_status$normal' )'
  echo
  echo -n $hotpink'(☞ ﾟヮﾟ)☞  '$mintgreen
end
