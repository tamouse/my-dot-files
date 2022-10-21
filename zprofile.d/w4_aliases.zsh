# Aliases for Wherefour work

WHEREFOUR_DIR="$HOME/Work/Wherefour"
alias .w4a="pushd $WHEREFOUR_DIR/wherefour-app/"
alias .reset="bundle exec rails db:migrate:reset"
alias .load="bundle exec rails db:fixtures:load"
alias .test="bundle exec rails test"
alias .sytest="MUTE_TEST_AUDIO=true bundle exec rails test test/system"
alias .brs="LOCAL_TUNNEL_HOST='tamouse.stunel.io' bundle exec rails server"
alias .st="st --port 3000 --subdomain tamouse"
alias .sk="bundle exec sidekiq | tee -a log/sidekiq.log"
alias byrl="bundle install && yarn install && bundle exec rails db:migrate:reset && bundle exec rails db:fixtures:load"
