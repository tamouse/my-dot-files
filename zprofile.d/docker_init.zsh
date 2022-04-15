# -*- mode: shell-script -*-

# If the docker-machine VM isn't running yet, this will produce a TLS error
#
# Re/Start the docker-machine VM with:
#     docker-machine restart
#

eval $(docker-machine env default)

# Robert Rouse's alias to keep systems clean
alias docker-prune='docker system df && docker container prune && docker volume prune && docker system prune && docker system df'
