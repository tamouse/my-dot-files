# A bunch of aliases that will build normbot scripts (for kickserv deployments in slack)

alias nbb='echo -n @norm ecs build production $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)|pbcopy'
alias ndb='echo -n @norm ecs deploy production $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)|pbcopy'
alias nndw='echo -n @norm no deploy ecs worker|pbcopy'
alias ndm='echo -n @norm ecs deploy production master|pbcopy'
alias nydw='echo -n @norm  deploy ecs worker|pbcopy'
