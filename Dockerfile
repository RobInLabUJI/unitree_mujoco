FROM osrf/ros:jazzy-desktop-full

RUN git clone https://github.com/unitreerobotics/unitree_sdk2.git \
 && cd unitree_sdk2/ && mkdir build && cd build \
 && cmake .. -DCMAKE_INSTALL_PREFIX=/opt/unitree_robotics \
 && sudo make install && cd ../.. && rm -fr unitree_sdk2

RUN sudo apt update \
 && sudo apt -y install libglfw3-dev libxinerama-dev \
    libyaml-cpp-dev libxcursor-dev libxi-dev python3-pip \
 && sudo rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/google-deepmind/mujoco.git --branch 3.2.7 \
 && cd mujoco/ && mkdir build && cd build \
 && cmake .. && make -j4 \
 && sudo make install && cd ../.. && rm -fr mujoco

RUN git clone https://github.com/eclipse-cyclonedds/cyclonedds -b releases/0.10.x \
 && cd cyclonedds && mkdir build install && cd build \
 && cmake .. -DCMAKE_INSTALL_PREFIX=../install \
 && cmake --build . --target install

