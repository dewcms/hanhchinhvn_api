FROM elixir:1.11.2-alpine AS build

# install build dependencies
RUN apk add --no-cache build-base

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
  mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

COPY config config
COPY priv priv
RUN mix phx.digest

# compile and build release
COPY lib lib
# uncomment COPY if rel/ exists
# COPY rel rel
RUN mix do compile, release

# prepare release image
FROM alpine:3.9 AS app
RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/hanhchinhvn_api ./

ENV HOME=/app

CMD ["bin/hanhchinhvn_api", "start"]
