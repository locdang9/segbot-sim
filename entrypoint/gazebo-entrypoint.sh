#! /bin/bash

echo "=======Install dependencies ======"
rosdep fix-permissions && rosdep update
rosdep install --from-paths src --ignore-src -r -y

echo "=======catkin_make ======"
source /opt/ros/noetic/setup.bash && catkin_make
source /root/catkin_ws/devel/setup.bash

echo "=====Configure gazebo to use office world======"
source /usr/share/gazebo/setup.sh
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$(rospack find segbot_gazebo)/models
export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:$(rospack find segbot_gazebo)/resource
printenv | grep GAZEBO
export TURTLEBOT3_MODEL=waffle
echo "===DONE==="
$1 