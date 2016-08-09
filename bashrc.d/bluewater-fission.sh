# aliases for bluewater fission project

alias vsrci="vagrant ssh -c 'cd sync && rake db:mongoid:create_indexes'"
alias vsrrad="vagrant ssh -c 'cd sync && rails runner \"AdminUser.create(email: %q(development@bluewaterbrand.com), password: %q(password!!!), password_confirmation: %q(password!!!))\"'"
alias vsrs="vagrant ssh -c 'cd sync && rails s -b 0.0.0.0'"
alias vstp="vagrant ssh -c 'cd sync && rake db:test:prepare'"
alias vstest="vagrant ssh -c 'cd sync && rake db:test:prepare && RAILS_ENV=test rake db:mongoid:create_indexes && xvfb-run rspec && xvfb-run cucumber --tags ~@skip'"
alias vsspec="vagrant ssh -c 'cd sync && rake db:test:prepare && RAILS_ENV=test rake db:mongoid:create_indexes && xvfb-run rspec '"
alias vscuke="vagrant ssh -c 'cd sync && rake db:test:prepare && RAILS_ENV=test rake db:mongoid:create_indexes && xvfb-run cucumber --tags ~@skip'"
