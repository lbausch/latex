# Use Debian Stretch to get a more recent version of KOMA-Script
FROM debian:buster

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

# Install further required LaTeX packages
RUN apt-get update && apt-get install biber python-pygments

# Install various packages
RUN apt-get update && apt-get install php-swiftmailer git inotify-tools

# Add an unprivileged user
RUN adduser --disabled-password --gecos '' latex && echo "latex:latex" | chpasswd
