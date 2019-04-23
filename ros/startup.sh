#!/bin/sh

source /home/ros/catkin_ws/devel/setup.bash
# start leapd service
leapd & >> /var/log/leapd.log
# start Leap Control Panel
LeapControlPanel