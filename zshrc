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

alias :q=exit

export WINEARCH=win32 # default to win32
export BROWSER=firefox

echo "ToDo's:"
cat ~/SparkleShare/Documents/todos
cat ~/SparkleShare/Documents/Termine.txt
cat ~/SparkleShare/Documents/notes.txt
mycal
