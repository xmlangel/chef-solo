FROM xmlangel/base-ubuntu:14.04
VOLUME /home

RUN curl -L http://www.opscode.com/chef/install.sh | sudo bash
RUN apt-get install -y ruby-full

