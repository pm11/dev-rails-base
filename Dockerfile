FROM ruby:2.2.0

RUN apt-get update -qq && \
    apt-get install -y \
      build-essential \
      libpq-dev

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

RUN mkdir -p /var/myapp
WORKDIR /var/myapp

ADD Gemfile /var/myapp/
#ADD Gemfile.lock /var/myapp/
RUN bundle install

ADD . /var/myapp

# ref.
#  https://github.com/docker-library/rails/blob/master/onbuild/Dockerfile
#  http://www.fig.sh/rails.html
