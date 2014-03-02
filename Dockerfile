FROM debian
MAINTAINER Casper Thomsen, cathper, ct@spag.dk
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get upgrade --yes
RUN apt-get install --yes curl
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN gpasswd -a root rvm
RUN apt-get install --yes procps

ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c 'rvm requirements'
RUN /bin/bash -l -c 'rvm install 2.0.0-p353'
RUN apt-get install --yes rubygems
RUN /bin/bash -l -c 'gem update --system && gem install bundler --no-ri --no-rdoc'

ENV DEBIAN_FRONTEND dialog
CMD /bin/bash -l -c 'rvm use 2.0.0-p353 --default'
