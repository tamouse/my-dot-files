# A bunch of aliases that will build normbot scripts (for kickserv deployments in slack)

alias nbb='echo -n @norm ecs build production $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)|pbcopy'
alias ndb='echo -n @norm ecs deploy production $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)|pbcopy'
alias nndw='echo -n @norm no deploy ecs worker|pbcopy'
alias ndm='echo -n @norm ecs deploy production master|pbcopy'
alias nydw='echo -n @norm yes deploy ecs worker|pbcopy'

# NOW WITH STAGING, TOO!

alias nbsb='echo -n @norm ecs build staging $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)|pbcopy'
alias ndsb='echo -n @norm ecs deploy staging $(git rev-parse --symbolic-full-name --abbrev-ref HEAD)|pbcopy'
alias nbsd='echo -n @norm ecs build staging develop|pbcopy'
alias ndsd='echo -n @norm ecs deploy staging develop|pbcopy'
