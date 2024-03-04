FROM ruby:3.3.0-alpine3.19

RUN apk add --no-cache build-base postgresql-dev tzdata bash vim git

WORKDIR /usr/src/app

RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
RUN bundle lock --add-platform x86_64-linux-musl
RUN bundle install

COPY . .

RUN addgroup -S 1000 && adduser -S 1000 -G 1000
USER 1000:1000

ENTRYPOINT [ "./bin/docker-entrypoint" ]

EXPOSE 3000
CMD ["./bin/rails", "server"]
