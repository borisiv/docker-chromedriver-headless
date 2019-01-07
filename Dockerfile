FROM ubuntu:18.04

RUN apt-get update \
 # Install dependencies.
 && apt-get install -y nodejs npm wget curl unzip openjdk-8-jre-headless \
 # Install ChromeDriver.
 && wget -N https://chromedriver.storage.googleapis.com/2.45/chromedriver_linux64.zip -P ~/ \
 && unzip ~/chromedriver_linux64.zip -d ~/ \
 && rm ~/chromedriver_linux64.zip \
 && mv -f ~/chromedriver /usr/local/bin/chromedriver \
 && chown root:root /usr/local/bin/chromedriver \
 && chmod 0755 /usr/local/bin/chromedriver \
 # Install Chrome.
 && curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
 && apt-get -y update \
 && apt-get -y install google-chrome-stable
