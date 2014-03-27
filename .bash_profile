alias flush_dns_cache='dscacheutil -flushcache'
alias loginEC2='ssh -i ~/.ssh/WebServer.pem ubuntu@ec2-54-224-0-17.compute-1.amazonaws.com'
alias puppeteerjs="cd ~/Projects/puppeteer"
alias krakenStart="java -jar kraken-service/target/kraken-service-0.0.1-SNAPSHOT.jar server kraken-service/dev.yml"
alias krakenDBMigrate="java -jar kraken-service/target/kraken-service-0.0.1-SNAPSHOT.jar db migrate kraken-service/dev.yml"
alias mci='mvn clean install'
alias em='emacs '
alias netstat_osx="sudo lsof -i -P"
alias ui-env='sudo ~/.my-scripts/ui-env.sh'
alias wp-env='sudo ~/.my-scripts/wp-env.sh'
alias learn-terminal='echo "Did you know that:"; whatis $(ls /usr/bin | gshuf -n 1) | cowsay'

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


export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/lib/python2.7/site-packages/django/bin:/usr/local/share/python:$PATH

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\$:$NO_COLOUR:\W$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

export JAVA_HOME=$(/usr/libexec/java_home)


# learn-terminal

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
