FROM ruby:2.1
MAINTAINER Marco Monteiro <marco@neniu.org>

CMD ["wagon", "serve"]
ENTRYPOINT ["bundle", "exec"]
EXPOSE 3333

WORKDIR /app
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
