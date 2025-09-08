FROM docker.io/puppet/pdk:latest

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends ruby ruby-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.4.13

