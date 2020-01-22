FROM ruby:2.6.5 as build-env

ENV APP_ROOT /slate
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile Gemfile.lock config.rb .editorconfig $APP_ROOT/
COPY lib $APP_ROOT/lib
COPY source $APP_ROOT/source

RUN apt-get update && apt-get install -y nodejs \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN gem install bundler && bundle install && bundle exec middleman build --clean

FROM nginx

LABEL maintainer="red-team@validity.com"

COPY --from=build-env slate/build /usr/share/nginx/html

EXPOSE 80
