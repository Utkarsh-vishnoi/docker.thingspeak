FROM ruby:2.1.4
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y --force-yes
RUN apt-get install -y --force-yes build-essential libpq-dev git
ADD Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install
#ADD thingspeak /opt/thingspeak/
RUN git clone https://github.com/Utkarsh-vishnoi/thingspeak.git /opt/thingspeak
WORKDIR /opt/thingspeak
#RUN bundle install
# DB setup
ADD database.yml config/database.yml
CMD bundle exec rails server -p $PORT
