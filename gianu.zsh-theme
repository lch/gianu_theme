setopt nopromptbang prompt{cr,percent,sp,subst}

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:clean' format '%F{green}✓%f'
  zstyle ':zim:git-info:dirty' format '%F{yellow}✗%f'
  zstyle ':zim:git-info:keys' format \
      'prompt' '(%F{green}%b%c %C%D)'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PROMPT='[%F{white}%n%f@%F{red}%m%f %F{cyan}%c%f ${(e)git_info[prompt]}%f]$ '
