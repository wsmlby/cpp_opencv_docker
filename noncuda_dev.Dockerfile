FROM rikorose/gcc-cmake:gcc-8

RUN apt update
RUN apt install -y libssl1.1 libssl-dev
RUN apt install -y libgstreamer1.0-dev
RUN apt-get install \
    libavutil-dev \
    libavcodec-dev \
    libavfilter-dev \
    libavformat-dev \
    libavdevice-dev \
    pkg-config \
    -y
RUN cd /tmp/ && wget -O opencv.zip https://github.com/opencv/opencv/archive/4.4.0.zip 
RUN cd /tmp/ && unzip opencv.zip
RUN cd /tmp/opencv-4.4.0 && mkdir build && cd build && cmake ..
RUN cd /tmp/opencv-4.4.0/build && cmake --build .
RUN cd /tmp/opencv-4.4.0/build && make install
RUN cd /tmp/ && rm -rf opencv-4.4.0 && rm opencv.zip
RUN apt install -y apt-utils
RUN apt install -y liborc-0.4-dev
RUN apt-get install -y libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
RUN apt install -y libgstreamer-plugins-base1.0-dev 
RUN apt install -y libgomp1
RUN apt install -y libprotobuf-dev protobuf-compiler
RUN apt install -y libpython3-dev
