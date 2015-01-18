#!/bin/bash

echo "running services RAILS_ENV=$RAILS_ENV"

rake db:create
rake db:migrate

if [ "$RAILS_ENV" = "production" ]; then
    rake assets:precompile
fi

echo "starting unicorn"
/usr/local/bundle/bin/bundle exec unicorn -c config/unicorn.rb -D

echo "starting nginx"
/etc/init.d/nginx start

sleep infinity
