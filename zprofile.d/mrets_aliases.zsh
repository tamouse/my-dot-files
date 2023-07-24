#! /usr/bin/env zsh

# Time-stamp: <2023-07-24 14:08:02 tamara>

alias .m="pushd $HOME/Documents/Work/mrets/"
alias .mr="pushd $HOME/Documents/Work/mrets-react/"

# Pull data from staging without enormous tables that aren't much use for dev/test
alias fetch_staging_dump="pg_dump --format=custom $(heroku config:get DATABASE_URL --app m-rets-staging) --exclude-table-data='(wregis|mrets)_mat_*' --exclude-table-data='versions' --exclude-table-data='version_associations'"

# quick drop and create dev database
alias qk_reset='dropdb m-rets_development && createdb m-rets_development'

# refresh databawe from data pulled
refresh_data() {
  pg_restore --verbose --clean --no-acl --no-owner -d m-rets_development < ${1}
  bin/rails util:update_user_passwwords_for_test PASSWORD=testtesttest
  createdb --template m-rets_development staging_$(timestamp|tr '-' '_')
  psql -c '\l'
}

# Fixup for 2.7.8
alias fix278="sed -i .bak -e 's/6/8/' .ruby-version"

# Fixup for update passwords
alias fixpw="sed -i .bak -e 's/25/12/' lib/tasks/util/update_user_passwords_for_test"
