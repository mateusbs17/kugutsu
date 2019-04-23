FROM ros:kinetic-ros-core
RUN apt-get update && apt-get -y install wget \
    libgl1-mesa-glx \
    libglu1-mesa \
    libxi6 \
    libxslt-dev \
    libasound2
RUN apt-get -y install libdbus-1-3 
RUN mkdir /home/ros && cd /home/ros && wget https://warehouse.leapmotion.com/apps/4186/download
RUN mv /home/ros/download /tmp/Leap_Motion_SDK_Linux_2.3.1.tgz

# COPY Leap_Motion_SDK_Linux_2.3.1.tgz /tmp/Leap_Motion_SDK_Linux_2.3.1.tgz
# COPY prl_mod.tar.gz /tmp/prl_mod.tar.gz

RUN chmod -R 777 /tmp

RUN cd /tmp && tar -xzvf Leap_Motion_SDK_Linux_2.3.1.tgz && \
    cd Leap* && \
    dpkg --install Leap-*-x64.deb

RUN mkdir /home/ros/catkin_ws && mkdir /home/ros/catkin_ws/src

RUN cd /home/ros/catkin_ws/src && \
    git clone https://github.com/ros-drivers/leap_motion.git

RUN rosdep install --from-paths /home/ros/catkin_ws/src --ignore-src -y

RUN cd /home/ros && /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd /home/ros/catkin_ws; catkin_make'

COPY startup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/startup.sh

RUN ln -s /usr/local/bin/startup.sh /

ENTRYPOINT ["startup.sh"]