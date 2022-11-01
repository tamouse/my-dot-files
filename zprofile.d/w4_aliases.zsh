# Settings for Wherefour work

export WHEREFOUR_DIR="$HOME/Work/Wherefour"

alias .w4a="pushd $WHEREFOUR_DIR/wherefour-app/"
alias .w4devdocs="pushd $WHEREFOUR_DIR/Meta/DevDocs/"
alias .reset="bundle exec rails db:migrate:reset"
alias .load="bundle exec rails db:fixtures:load"
alias .test="bundle exec rails test"
alias .sytest="bundle exec rails test test/system"
alias .brs="bundle exec rails server"
alias .sk="bundle exec sidekiq | tee -a log/sidekiq.log"
alias .ngk='ngrok http --log log/ngrok.log --log-format logfmt 3000'
alias .byrl="bundle install && yarn install && bundle exec rails db:migrate:reset && bundle exec rails db:fixtures:load"

## Testing
export MUTE_TEST_AUDIO=true
export NO_WHEREFOUR_REPORTER=1

## Docker
export DATABASE_USER=wherefour
export DATABASE_PASSWORK=wherefour
export DATABASE_HOST=postgresql

## LeafLink
export TUNNEL_LOCAL_HOST=''
echo Remember to set TUNNEL_LOCAL_HOST after you have started ngrok!
