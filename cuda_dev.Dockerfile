FROM nvidia/cuda:10.2-devel-ubuntu18.04
RUN apt update
RUN apt install -y libssl1.1 libssl-dev
RUN apt install -y libgstreamer1.0-dev
RUN apt install -y apt-utils
RUN apt install -y liborc-0.4-dev
RUN apt-get install -y libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
RUN apt install -y libgstreamer-plugins-base1.0-dev 
RUN apt install -y unzip
RUN apt install -y wget
RUN wget https://github.com/Kitware/CMake/releases/download/v3.18.4/cmake-3.18.4-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh

ENV PATH="/usr/bin/cmake/bin:${PATH}"
RUN cd /tmp/ && wget -O opencv.zip https://github.com/opencv/opencv/archive/4.4.0.zip
RUN cd /tmp/ && unzip opencv.zip
RUN cd /tmp/opencv-4.4.0 && mkdir build && cd build && cmake ..
RUN cd /tmp/opencv-4.4.0/build && cmake --build .
RUN cd /tmp/opencv-4.4.0/build && make install
RUN cd /tmp/ && rm -rf opencv-4.4.0 && rm opencv.zip
RUN apt install -y git
