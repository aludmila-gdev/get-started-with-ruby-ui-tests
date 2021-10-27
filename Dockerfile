FROM ruby:2.6.8

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update -y && \
  apt-get install -y unzip xvfb \
  qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5webkit5-dev \
  gstreamer1.0-plugins-base \
  gstreamer1.0-tools gstreamer1.0-x \
  freetds-dev \
  libnss3 libxi6 libgconf-2-4

WORKDIR /app

RUN mkdir -p /app

# install required gem files for Capybara
COPY ./Gemfile /app
RUN gem install bundler
RUN bundle install

# Set up the Chrome PPA
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Update the package list and install chrome
RUN apt-get update -y
RUN apt-get install -y google-chrome-stable=95.0.4638.54-1

# Set up Chromedriver Environment variables
ENV CHROMEDRIVER_VERSION 95.0.4638.17
ENV CHROMEDRIVER_DIR /usr/bin/chromedriver
RUN mkdir $CHROMEDRIVER_DIR

# Download and install Chromedriver
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

# Put Chromedriver into the PATH
ENV PATH $CHROMEDRIVER_DIR:$PATH

COPY . .
