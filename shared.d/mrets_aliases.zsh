#! /usr/bin/env zsh

# Time-stamp: <2023-09-14 14:15:58 tamara>

export Work=$HOME/Work
alias .m="pushd $Work/mrets/"
alias .mr="pushd $Work/mrets-react/"

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
  dropdb m-rets_development
  createdb -T ${1} m-rets_development
}

# refresh databawe from data pulled
refresh_data() {
  pg_restore --verbose --clean --no-acl --no-owner -d m-rets_development < ${1}
  bin/rails util:update_user_passwords_for_test PASSWORD=testtesttest
  createdb --template m-rets_development ${2}_$(timestamp|tr '-' '_')
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
alias dcpgdropdb="docker compose run --rm postgres_db /bin/bash -l -c 'pg_ctl start && dropdb m-rets_development && dropdb m-rets_test ; psql -c \"\l\" '"
alias dcpgcreatedb="docker compose run --rm postgres_db /bin/bash -l -c 'pg_ctl start && createdb m-rets_development && createdb m-rets_test ; psql -c \"\l\" '"
dcpgrestore() {
  dumpfile=${1}
  base=$(basename $dumpfile)
  name=$(basename $dumpfile .dump)
  cp ${dumpfile} tmp/${base}
  echo Dropping and creating data base
  docker compose run --rm postgres_db /bin/bash -l -c 'pg_ctl start; dropdb m-rets_development; createdb m-rets_development; psql -c "\l"'
  echo Restoring the data from the dump $dumpfile
  docker compose run --rm postgres_db /bin/bash -l -c "pg_ctl start; pg_restore  --verbose --clean --no-acl --no-owner -d m-rets_development < app/tmp/${base}"
  sed -i .bak -e 's/25/12/' lib/tasks/util/update_user_passwords_for_test.rake
  git update-index --assume-unchanged lib/tasks/util/update_user_passwords_for_test.rake
  echo Fixing up the passwords
  docker compose run --rm api /bin/bash -l 'bundle exec rails util:update_user_passwords_for_test PASSWORD=testtesttest'
  echo Making a backup db
  docker compose run --rm postgres_db /bin/bash -l -c "pg_ctl start; createdb -T m-rets_development $name; psql -c \"\l\""
  unset name
  unset base
  unset dumpfile
}
