# e

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# append to the history file, don't overwrite it
shopt -s histappend

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


git_prompt() {
    #https://www.youtube.com/watch?v=-gYtV9z7hhw
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"
    [ -n "${branch}" ] && echo "(${branch}) "
}


#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] $(git_prompt)'
