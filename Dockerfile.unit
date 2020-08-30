FROM ruby:2.7.1-alpine

RUN bundle config --global frozen 1 && \
    bundle config set without 'test development' && \
    apk add --no-cache --update build-base tzdata yarn openssl mysql-dev

COPY Gemfile Gemfile.lock ./

ENV RAILS_ENV=production

RUN bundle install

COPY . .

RUN openssl genrsa 2048 > ./storage/jwt.pem

RUN rake assets:precompile

EXPOSE 3000

RUN rm -rf node_modules

ENTRYPOINT ["sh","entrypoint.sh"]
