doge

# OS X trash (`brew install trash`) util.
function rm
  trash $argv
end

function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q -g __fish_classic_git_functions_defined
    set -g __fish_classic_git_functions_defined

    function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
      if status --is-interactive
        set -e __fish_prompt_user
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
      if status --is-interactive
        set -e __fish_prompt_host
        commandline -f repaint ^/dev/null
      end
    end

    function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
      if status --is-interactive
        set -e __fish_prompt_status
        commandline -f repaint ^/dev/null
      end
    end
  end

  set -l delim '>'

  switch $USER

  case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

  case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

  end

  set -l prompt_status
  if test $last_status -ne 0
    if not set -q __fish_prompt_status
      set -g __fish_prompt_status (set_color $fish_color_status)
    end
    set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
  end

  if not set -q __fish_prompt_user
    set -g __fish_prompt_user (set_color $fish_color_user)
  end
  if not set -q __fish_prompt_host
    set -g __fish_prompt_host (set_color $fish_color_host)
  end

  echo -n -s "$__fish_prompt_user" "$USER" "$__fish_prompt_normal" @ "$__fish_prompt_host" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd) (__fish_git_prompt) "$__fish_prompt_normal" "$prompt_status" "$delim" ' '
end


# customize your prompt!
# function fish_prompt
#   # set_color yellow
#   # echo -n (date +'%H:%M') ' '
#   # set_color cyan
#   # echo -n (pwd)
#   # set_color green
#   #echo -n ' ❯'

#   if not set -q -g __fish_robbyrussell_functions_defined
#   set -g __fish_robbyrussell_functions_defined
#   function _git_branch_name
#     echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
#   end

#   function _is_git_dirty
#     echo (git status -s --ignore-submodules=dirty ^/dev/null)
#   end
#   end

#   set -l cyan (set_color -o cyan)
#   set -l yellow (set_color -o yellow)
#   set -l red (set_color -o red)
#   set -l blue (set_color -o blue)
#   set -l green (set_color -o green)
#   set -l normal (set_color normal)

#   set -l arrow "$yellow" (date +'%H:%M') ' '
#   set -l cwd $cyan(basename (prompt_pwd))

#   if [ (_git_branch_name) ]
#   set -l git_branch $red(_git_branch_name)
#   set git_info "$blue git:$git_branch$blue"

#   if [ (_is_git_dirty) ]
#     set -l dirty "$yellow ✗"
#     set git_info "$git_info$dirty"
#   end
#   end

#   echo -n -s $arrow $cwd $git_info $green ' ❯ ' $normal

# end
