FROM ruby:2.2
MAINTAINER Robert Williams <rob@r-williams.com>

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /opt/ecb_rates
WORKDIR /opt/ecb_rates
ADD config/database.yml.example config/database.yml

ENV RAILS_ENV production
CMD ["./bin/rails", "server", "-d", "'0.0.0.0'"]
