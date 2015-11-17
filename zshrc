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

activatevirtualenv() {
	if [ -n "$VIRTUAL_ENV" ]; then
		if [[ ! $PWD -pcre-match "^$VIRTUAL_ENV.*" ]]; then
			print "Deactivating virtualenv"
			deactivate
		fi
	else
		if [[ -f ./bin/activate ]]; then
			print "Activating virtualenv"
			. bin/activate
		fi
	fi
}

cd() {
	if (( ${#argv} == 1 )) && [[ -f ${1} ]]; then
		[[ ! -e ${1:h} ]] && return 1
		print "Correcting ${1} to ${1:h}"
		builtin cd ${1:h}
		activatevirtualenv
	else
		builtin cd "$@"
		activatevirtualenv
	fi
}

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

zstyle ':prompt:grml:*:items:user' pre '%F{blue}'
eval $(dircolors ~/.dircolors)
source ~/.aliases

