FROM ruby:2.6.3-alpine

ENV APP_ROOT /slate
RUN mkdir -p $APP_ROOT

COPY Gemfile Gemfile.lock config.rb .editorconfig $APP_ROOT/
COPY lib $APP_ROOT/lib
COPY source $APP_ROOT/source
WORKDIR $APP_ROOT

RUN apk add --no-cache build-base libxml2-dev libxslt-dev \
  && apk update && apk upgrade && apk add curl wget bash \
  && apk add nodejs && rm -rf /var/lib/apt/lists/* \
  && gem install nokogiri -- --use-system-libraries \
  && gem update bundler && bundle install \
  && rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
