[ -d /usr/local/opt/postgresql\@12/bin ] && \
    export PATH=/usr/local/opt/postgresql\@12/bin:$PATH

# Mainly useful if you want to run pg manually
# alias pgstart='pg_ctl -D /usr/local/var/postgres start -l /usr/local/var/postgres/server.log'
# alias pgup='pg_ctl -D /usr/local/var/postgres start -l /usr/local/var/postgres/server.log'
# alias pgstop='pg_ctl -D /usr/local/var/postgres stop'
# alias pgdn='pg_ctl -D /usr/local/var/postgres stop'
# alias pgstatus='pg_ctl -D /usr/local/var/postgres status'
# alias pgst='pg_ctl -D /usr/local/var/postgres status'
