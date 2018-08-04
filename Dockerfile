FROM ruby:2.5.0
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 1.16.2
RUN bundle install
COPY . .
CMD puma -C config/puma.rb -p 4242