# The following lines were added by compinstall
zstyle :compinstall filename '/home/roughl/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

export PATH=$PATH:~/bin
zmodload zsh/pcre

alias :q=exit

export WINEARCH=win32 # default to win32
export BROWSER=firefox

echo "ToDo's:"
year=$(date +%Y)
month=$(date +%m)
nmonth=$(printf "%02d" $(($month+1)))
cat ~/SparkleShare/Documents/todos
egrep ($year-$month|$year-$nmonth) ~/SparkleShare/Documents/Termine.txt
cat ~/SparkleShare/Documents/notes.txt
mycal

function virtual_env_prompt () {
	REPLY=${VIRTUAL_ENV+(${VIRTUAL_ENV:t}) }
}

grml_theme_add_token virtual-env -f virtual_env_prompt '%F{magenta}' '%f'
zstyle ':prompt:grml:left:setup' items \
	rc virtual-env change-root user at host path vcs percent
zstyle ':prompt:grml:*:items:user' pre '%F{blue}'

eval $(dircolors ~/.dircolors)
source ~/.aliases

if [ -x /usr/bin/thefuck ]; then
	eval "$(/usr/bin/thefuck --alias)"
fi

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export PROJECT_HOME=$HOME/proggen
	source /usr/bin/virtualenvwrapper.sh
fi

if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi


if [ -f /usr/share/autojump/autojump.zsh ]; then
    source /usr/share/autojump/autojump.zsh
fi

if [ -d /usr/share/fzf/ ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
elif [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

if [ -f ~/.profile ]; then
    source ~/.profile
fi
