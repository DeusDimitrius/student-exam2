FROM python:latest

MAINTAINER Dmitry Balashov <dbalash0w@yandex.ru>

ENV REFRESHED_AT 2019-01–28

LABEL Description="Dockerfile for the webapp" \
        Vendor="Balashov Dmitry" \
        Version="0.1"

# Assign the working directory
WORKDIR /usr/app

# Copy files from github
RUN git clone https://github.com/DeusDimitrius/student-exam2.git
WORKDIR /usr/app/student-exam2

# Install venv for python3
RUN \
    pip install --upgrade pip \
  && python3 -m venv venv \
  && . venv/bin/activate 

RUN  pip install -e .  

# For flask use js_example
ENV FLASK_APP=js_example

# Making port 5000 available outside the container
EXPOSE 5000

# Run the application after running the container
CMD flask run --host=0.0.0.0
