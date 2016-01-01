alias flush_dns_cache='dscacheutil -flushcache'
alias netstat_osx="sudo lsof -i -P"
alias java-repl="java -jar ~/.my-utils/javarepl.jar"
alias mci="mvn clean install"
alias start-static-server="python -m SimpleHTTPServer 8000"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'
alias ls='ls -G'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'


export PATH=/Users/dpavao/.android-sdk/sdk/tools:/Users/dpavao/.android-sdk/sdk/platform-tools:/Users/dpavao/.node/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:$PATH

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\$:$NO_COLOUR:\W$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/dpavao/.android-sdk/sdk
export SAUCE_USERNAME=derek-pavao-nsl
# export SAUCE_ACCESS_KEY=KEY_HERE


# learn-terminal

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

###-tns-completion-start-###
if [ -f /Users/dpavao/.tnsrc ]; then
    source /Users/dpavao/.tnsrc
fi
###-tns-completion-end-###

###-tns-completion-start-###
if [ -f /Users/dpavao/.tnsrc ]; then
    source /Users/dpavao/.tnsrc
fi
###-tns-completion-end-###

export NVM_DIR="/Users/dpavao/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
