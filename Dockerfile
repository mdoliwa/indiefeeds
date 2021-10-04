FROM ruby:3.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./app
RUN bundle install

COPY . ./app

CMD ["rails", "server", "-b", "0.0.0.0"]
