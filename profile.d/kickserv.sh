# aliases for the kickserv project

## access the production server console or database
alias prodcon='bin/ecs add_public_ip production tamouse && bin/ecs console production_app'
alias proddb='bin/ecs add_public_ip production tamouse && bin/ecs psql production_app'
