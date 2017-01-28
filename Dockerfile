# Use Debian Stretch to get a more recent version of KOMA-Script
FROM debian:stretch

# Set maintainer
LABEL maintainer="Lorenz Bausch <info@lorenzbausch.de>"

# Use noninteractive mode
ARG DEBIAN_FRONTEND=noninteractive

# Do not install recommended packages
RUN echo "APT::Get::Install-Recommends "false";" >> /etc/apt/apt.conf.d/ZZ.conf

# Install packages without confirmation
RUN echo "APT::Get::Assume-Yes "true";" >> /etc/apt/apt.conf.d/ZZ.conf

# Install LaTex packages
RUN apt-get update && apt-get install texlive-full

# Install further required packages
RUN apt-get update && apt-get install biber python-pygments

# Install various packages
RUN apt-get update && apt-get install php-swiftmailer git inotify-tools

# Add a user
RUN adduser --disabled-password --gecos '' lb && echo "lb:lb" | chpasswd

# Clean up
RUN apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
