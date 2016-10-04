####################################################
#   Source:  https://github.com/haukehein/torch7   #
####################################################

# Get this from:  https://github.com/haukehein/phusion_passenger-customizable
FROM haukehein/phusion_passenger-customizable:0.9.19_update
MAINTAINER haukehein <BitCrusher@gmx-topmail.de>

ENV HOME /root
SHELL ["/bin/bash", "--login -c"]

RUN cd && \
apt-get update && \
apt-get -y install bash sudo wget git libreadline-dev && \
git clone https://github.com/torch/distro.git ~/torch --recursive && \
cd ~/torch && \
bash ./install-deps && \
./install.sh && \
source ~/.bashrc && \
cd  && \
apt-get -y autoremove && \
apt-get clean && \
rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
