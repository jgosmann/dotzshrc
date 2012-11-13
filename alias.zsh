
alias cp='nocorrect cp'
alias rm='nocorrect rm'
alias mv='nocorrect mv'

alias gsr='git svn rebase'
alias gsd='git svn dcommit --rmdir'

alias make='make -j 2'

alias mysqlstart="sudo /opt/local/bin/mysqld_safe5"
alias mysqlstop="/opt/local/bin/mysqladmin5 -u root -p shutdown"

alias postgres-restart="sudo -u postgres /Library/PostgreSQL/9.0/bin/pg_ctl -D /Library/PostgreSQL/9.0/data restart"
alias postgres-kill="ps -A | grep postgres | cut -f 1 -d ' ' | xargs sudo kill"

if ! (type -p netcat > /dev/null); then
    alias netcat=nc
fi

