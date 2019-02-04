FROM alpine:latest
  
MAINTAINER Dmitry Balashov <dbalash0w@yandex.ru>

ENV REFRESHED_AT 2019-01-28

LABEL Description="Dockerfile for the webapp" \
        Vendor="Balashov Dmitry" \
        Version="0.1"

RUN apk get update && apk add py-pip python3 zip curl git && pip install --upgrade pip

# Assign the working directory
RUN mkdir epam_exam2
WORKDIR student_exam2

RUN \
    git clone https://github.com/DeusDimitrius/student-exam2.git \
    && apk del zip curl git

WORKDIR epam_exam2/student-exam2

RUN \
  python3 -m venv venv \
  && . venv/bin/activate \
  pip install -e .

# For flask use js_example
ENV FLASK_APP=js_example

# Making port 5000 available outside the container
EXPOSE 5000

