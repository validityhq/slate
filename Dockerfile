FROM ruby:2.6.5

ENV APP_ROOT /slate
RUN mkdir -p $APP_ROOT
RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock config.rb .editorconfig $APP_ROOT/
COPY lib $APP_ROOT/lib
COPY source $APP_ROOT/source
WORKDIR $APP_ROOT

RUN gem install bundler
RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
