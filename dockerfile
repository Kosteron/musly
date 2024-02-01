# Use an official C++ runtime as the base image
FROM gcc:6.4

# Add the old repository of jessie debian
RUN echo "deb [trusted=yes] http://archive.debian.org/debian jessie main" > /etc/apt/sources.list
RUN echo "deb [trusted=yes] http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list

# Install git
RUN apt-get update && apt-get install -y git cmake libeigen3-dev libavcodec-dev libavformat-dev libavutil-dev

# git clone the source code
WORKDIR /
RUN git clone https://github.com/dominikschnitzer/musly.git musly
RUN mkdir /musly/build
WORKDIR /musly/build
RUN cmake ..
RUN make
RUN make install

# Set a generic entrypoint using bash
CMD ["/bin/bash"]