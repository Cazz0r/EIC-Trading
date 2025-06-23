FROM ruby:3.2.4
RUN mkdir /app
WORKDIR /app
RUN gem update --system 3.4.22 && gem install bundler -v 2.4.22
COPY Gemfile ./
RUN bundle install
COPY . .
CMD puma -C config/puma.rb -p 4242