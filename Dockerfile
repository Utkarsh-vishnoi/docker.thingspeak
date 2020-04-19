FROM ruby:2.1.4
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update 
RUN apt-get upgrade --force-yes -y
RUN apt-get install -y build-essential libpq-dev git
WORKDIR /opt/
# thingspeak SETUP
RUN git clone https://github.com/Utkarsh-vishnoi/thingspeak.git
WORKDIR /opt/thingspeak
RUN bundle install
# DB setup
ADD database.yml config/database.yml
CMD bundle exec rails server -p $PORT
