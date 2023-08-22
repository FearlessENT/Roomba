# Use the official ROS Melodic image as a base image
FROM ros:melodic


RUN apt-get update && apt-get install -y \
    ros-melodic-gazebo-ros \
    ros-melodic-gazebo-ros-control \
    ros-melodic-rviz



# Set the working directory
WORKDIR /home/roomba

# Create a src directory for the ROS workspace
RUN mkdir -p /home/roomba/src

# Copy your "roomba" ROS package into the src directory
COPY ./roomba /home/roomba/src/roomba



# Build and source your "roomba" ROS package
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; cd /home/roomba; catkin_make'

# Source the ROS setup script
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN echo "source /home/roomba/devel/setup.bash" >> ~/.bashrc

# Run roscore as the default command when the container starts
CMD ["roscore"]
