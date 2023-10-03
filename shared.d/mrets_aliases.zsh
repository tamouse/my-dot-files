#! /usr/bin/env zsh

# Time-stamp: <2023-09-15 12:18:36 tamara>

export Work=$HOME/Work
alias .m="pushd $Work/mrets/"
alias .mr="pushd $Work/mrets-react/"

export DEV_DB='m-rets_development'

# Pull data from staging without enormous tables that aren't much use for dev/test
# alias fetch_staging_dump="pg_dump --format=custom \$(heroku config:get DATABASE_URL --app m-rets-staging) --exclude-table-data='(wregis|mrets)_mat_*' --exclude-table-data='versions' --exclude-table-data='version_associations'"
# alias fetch_rc_dump="pg_dump --format=custom \$(heroku config:get DATABASE_URL --app m-rets-rc) --exclude-table-data='(wregis|mrets)_mat_*' --exclude-table-data='versions' --exclude-table-data='version_associations'"
fetch_dump() {
  environment=${1}
  heroku_environment="m-rets-${environment}"
  outfile="${environment}_$(timestamp).dump"
  outdir="$Work/DATA"
  pg_dump --format=custom $(heroku config:get DATABASE_URL --app ${heroku_environment}) \
          --exclude-table-data='(wregis|mrets)_mat_*' --exclude-table-data='versions' --exclude-table-data='version_associations' \
          > "$outdir/$outfile"
  unset environment
  unset heroku_environment
  unset environment
  unset outdir
}

# quick drop and create dev database from template
qk_reset() {
  dropdb "${DEV_DB}"
  createdb -T ${1} "${DEV_DB}"
}

# refresh databawe from data pulled
refresh_data() {
  pg_restore --verbose --clean --no-acl --no-owner -d "${DEV_DB}" < ${1}
  bin/rails util:update_user_passwords_for_test PASSWORD=testtesttest
  createdb --template "${DEV_DB}" ${2}_$(timestamp|tr '-' '_')
  psql -c '\l'
}

# Fixup for 2.7.8
fix278() {
  sed -i .bak -e '/2\.7\.6/s/6/8/' .ruby-version
  sed -i .bak -e "/^ruby/s/ruby '~> 2\.7\.6'/ruby '~> 2.7.8'/" Gemfile
  git update-index --assume-unchanged .ruby-version Gemfile Gemfile.lock
  bundle install
}

# Fixup for update passwords
fixpwupdate() {
  sed -i .bak -e 's/25/12/' lib/tasks/util/update_user_passwords_for_test.rake
  git update-index --assume-unchanged lib/tasks/util/update_user_passwords_for_test.rake
}

# DOCKER STUFF

alias dcresetdb='docker compose run --rm sidekiq bundle exec rails db:drop db:create db:schema:load'
alias dccreate='docker compose run --rm sidekiq bundle exec rake db:create db:schema:load'
alias dcreseed='docker compose run --rm sidekiq bundle exec rails util:full_seeds'
alias dclsdb='docker compose run --rm postgres_db /bin/bash -lc "pg_ctl start && psql -c \"\l\""'
alias dcpg='docker compose run --rm postgres_db /bin/bash -l '
alias dcapi='docker compose run --rm api /bin/bash -l '
alias dcbrc='docker compose run --rm api /bin/bash -l -c "bundle exec rails console" '
alias dcbrr='docker compose run --rm api /bin/bash -l -c "bundle exec rails runner" '
alias dcdbmigrate='docker compose run --rm api /bin/bash -l -c "bundle exec rails db:migrate" '
alias dcbtestprepare='docker compose run --rm api /bin/bash -l -c "bundle exec rails db:test:prepare" '
alias dcrspec='docker compose run --rm api /bin/bash -l -c "bundle exec rails db:test:prepare; bundle exec rspec" '

alias dcpgdropdb="docker compose run --rm postgres_db /bin/bash -l -c 'pg_ctl start && dropdb "${DEV_DB}" && dropdb m-rets_test ; psql -c \"\l\" '"
alias dcpgcreatedb="docker compose run --rm postgres_db /bin/bash -l -c 'pg_ctl start && createdb "${DEV_DB}" && createdb m-rets_test ; psql -c \"\l\" '"
dcpgrestore() {
  docker compose run --rm postgres_db /bin/bash -l -c "pg_ctl start && pg_restore --verbose --clean --no-acl --no-owner -d ${DEV_DB} ${1}"
}
dcpgsave_backup() {
  docker compose run --rm postgres_db /bin/bash -l -c "pg_ctl start && createdb -T ${DEV_DB} ${1}"
}
