# Base Image - Node Platform
FROM node:12.20-alpine as node

LABEL maintainer="Bluefletch" version="0.1.0"

COPY requirements.txt ./

# Install git
RUN apk --no-cache add git

# MkDocs Material
RUN \
    apk add --update \
        build-base python3-dev \
        python3 \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip; fi \
    && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
    && pip3 install --no-cache-dir -r requirements.txt \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*



# Install Firebase CLI
RUN npm install -g firebase-tools

## Original credit to tkikuchi2000@gmail.com
