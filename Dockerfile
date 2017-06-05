FROM elixir:1.4.4
MAINTAINER matt@sudoseng.com

RUN \
  curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
  apt-get update && \
  apt-get install -y nodejs pdftk xvfb wkhtmltopdf && \
  npm install -g yarn && \
  MIX_ENV=prod mix local.rebar && \
  MIX_ENV=prod mix local.hex --force && \
  echo "Node: $(node -v)" && \
  echo "NPM: $(npm -v)"
