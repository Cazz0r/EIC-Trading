FROM ruby:2.6.6
RUN mkdir /app
WORKDIR /app
RUN gem install bundler -v 1.17.3
COPY Gemfile ./
RUN bundle install
COPY . .
CMD puma -C config/puma.rb -p 4242