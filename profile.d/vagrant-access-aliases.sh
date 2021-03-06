# aliases for bluewater fission project; not working on this
# but these are a pretty good example of using aliases with
# a vagrant box

vsc () {
    echo "starting $@ on vm"
    time vagrant ssh -c "cd sync && $@"
    echo "finished $@ on vm"
}

alias vsbundle="vsc bundle"
alias vsrci="vsc 'rake db:mongoid:create_indexes'"
alias vsrrad="vsc 'rails runner \"AdminUser.create(email: %q(development@bluewaterbrand.com), password: %q(password!!!), password_confirmation: %q(password!!!))\"'"
alias vsrailsserv="vsc 'rails s -b 0.0.0.0'"
alias vstestprep="vsc 'rake db:test:prepare'"
alias vsspec="vsc 'xvfb-run rspec '"
alias vscuke="vsc 'xvfb-run cucumber --tags ~@skip'"
alias vstestall="vsc 'xvfb-run rspec && xvfb-run cucumber --tags ~@skip'"
