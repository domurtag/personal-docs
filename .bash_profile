#!/bin/bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export SVN_EDITOR=vi

alias ls='ls -1l'
alias report='open target/test-reports/html/all.html'

alias show='defaults write com.apple.Finder AppleShowAllFiles TRUE'
alias hide='defaults write com.apple.Finder AppleShowAllFiles FALSE'
alias sql='mysql -u root'

alias stopSql='sudo /usr/local/mysql/support-files/mysql.server stop'
alias startSql='sudo /usr/local/mysql/support-files/mysql.server start'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | sed -e 's/^[[:space:]]*//'
}

# Set command prompt to show current Git branch
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\$(parse_git_branch)\[\033[01;34m\]\w\[\033[00m\]\$ "

function java6 {
	export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_37-b06-434.jdk/Contents/Home
	export PATH=$JAVA_HOME/bin:$PATH
	export GRAILS_OPTS="-Xms600m -Xmx1200m -XX:MaxPermSize=128m"
}  

function java7 {
	export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
	export PATH=$JAVA_HOME/bin:$PATH
	export GRAILS_OPTS="-Xms600m -Xmx1200m -XX:MaxPermSize=128m"
}  

function java8 {
	export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
	export PATH=$JAVA_HOME/bin:$PATH

	# specifying perm gen size is unsupported in JDK8
	export GRAILS_OPTS="-Xms600m -Xmx1200m" 
}

# set the default java version
java8

export PATH=/opt/local/bin:/opt/local/sbin:$JAVA_HOME/bin:/usr/local/mysql/bin:/opt/subversion/bin:$PATH
