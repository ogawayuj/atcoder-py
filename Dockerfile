FROM python:3.8-buster
USER root

ARG PROXY

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

ENV HTTP_PROXY $PROXY
ENV HTTPS_PROXY $PROXY

RUN mkdir -p /root/src
COPY requirements.txt /root/src
WORKDIR /root/src

RUN pip install --no-cache-dir -r requirements.txt 
