FROM ruby:2.7.1-alpine

RUN bundle config --global frozen 1 && \
    bundle config set without 'test,development' && \
    apk add --no-cache --update build-base sqlite-dev tzdata yarn openssl mysql-dev
    # linux-headers \
    # git \
    # postgresql-dev \
    # nodejs \
    # yarn \
    # tzdata \
    # graphviz \
    # gmp-dev

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN openssl genrsa 2048 > ./storage/jwt.pem

RUN rails assets:precompile


EXPOSE 3000

ENTRYPOINT ["sh","entrypoint.sh"]
