#!/bin/sh

if [ $(id -u) -ne 0 ]; then
	echo ""
	echo ""
	echo ""
	echo "This script requires root access to execute"
	echo "Type:"
	echo ""
	echo "    sudo sh ${0##*/}"
	echo ""
	sleep 2
	echo -n "Press EnterKey to continue."
	read enterKey
	echo ""
	echo ""
	echo ""
	exit 0
fi

#!/bin/sh

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get -y update
sudo apt-get -y install ros-kinetic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt-get -y install ros-kinetic-catkin
sudo apt-get install -y cmake python-catkin-pkg python-empy python-nose python-setuptools libgtest-dev

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
source devel/setup.bash