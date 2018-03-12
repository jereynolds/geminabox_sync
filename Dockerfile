FROM alpine:latest

MAINTAINER Jacob Reynolds <jacob.e.reynolds@gmail.com>

RUN apk add --no-cache \
  ruby \
  ruby-dev \
  make \
  gcc \
  libc-dev

RUN echo 'gem: --no-document' >> /etc/gemrc

RUN mkdir -p /opt/geminabox_sync

COPY . /opt/geminabox_sync

WORKDIR /opt/geminabox_sync

RUN gem install bundler \
  && gem build /opt/geminabox_sync/geminabox-sync.gemspec \
  && gem install geminabox-sync \
  && bundle install --without development test

CMD sh /opt/geminabox_sync/docker/entry.sh
