FROM ruby:2.7.1-alpine

RUN bundle config --global frozen 1 && \
    apk add --no-cache --update build-base sqlite-dev tzdata yarn
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

RUN rails db:migrate

ENTRYPOINT ["rails","server","-b","0.0.0.0"]
