FROM debian:jessie-slim

RUN apt-get update && apt-get install -y \
    xvfb chromium \
    python python-pip curl unzip vim libgconf-2-4 --fix-missing


ENV CHROMEDRIVER_VERSION 2.29

RUN curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
  && rm "chromedriver_linux64.zip"

COPY ./ /winnaker/

RUN pip install /winnaker/

ENTRYPOINT ["winnaker", "-hl"]
