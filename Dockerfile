FROM osrf/ros:noetic-desktop-full 
# copy install scripts
COPY ./install /root/install

# update and install dependencies
RUN /bin/sh -e -c /root/install/i_dep.sh
# set default bash shell
SHELL ["/bin/bash", "-c"]
# set environment variable for ros
RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
RUN echo "export ROS_MASTER_URI=http://localhost:11311" >> /root/.bashrc

# Build ROS packages
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws
RUN source /opt/ros/noetic/setup.bash && \
    catkin_make && \
    echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc
    
# nvidia-container-runtime
# ENV NVIDIA_VISIBLE_DEVICES \
#     ${NVIDIA_VISIBLE_DEVICES:-all}
# ENV NVIDIA_DRIVER_CAPABILITIES \
#     ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
