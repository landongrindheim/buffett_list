FROM ruby:2.6

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  postgresql-client

COPY Gemfile* /usr/app/src/
WORKDIR /usr/app/src/

RUN bundle install

COPY . /usr/app/src/

ENTRYPOINT ["bundle", "exec"]
