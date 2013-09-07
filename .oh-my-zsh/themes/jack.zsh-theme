# zsh theme requires 256 color enabled terminal
# i.e TERM=xterm-256color
# Preview - http://www.flickr.com/photos/adelcampo/4556482563/sizes/o/
# based on robbyrussell's shell but louder!

if [ `id -u` -eq "0" ] ; then
PCHAR="#"
else
PCHAR="❯"
fi


PCOLOR='%(?.%F{235}.%F{red})'
PROMPT='%F{180}%5~ $(git_prompt_info)  %F{235}$(_maybe_venv)
$PCOLOR$PCHAR %{$reset_color%}'

RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{059}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%F{113}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}%B✘%b"
ZSH_THEME_GIT_PROMPT_CLEAN=""

_maybe_venv ()
{
if [ -n "$VIRTUAL_ENV" ] ; then
echo `basename $VIRTUAL_ENV`
fi

}

export GIT_PS1_SHOWDIRTYSTATE=true

export VIRTUAL_ENV_DISABLE_PROMPT=1
