FROM ruby:2.2
MAINTAINER Robert Williams <rob@r-williams.com>

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /opt/ecb_rates
WORKDIR /opt/ecb_rates

ENV RAILS_ENV production
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
