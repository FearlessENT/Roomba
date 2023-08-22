# Use the official ROS Melodic image as a base image
FROM ros:melodic

# Set the working directory
WORKDIR /home/roomba


# Copy your "roomba" ROS package into the container
COPY ./roomba /home/roomba/roomba

# Build and source your "roomba" ROS package
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; cd /home/roomba; catkin_make'

# Source the ROS setup script
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN echo "source /home/roomba/devel/setup.bash" >> ~/.bashrc

# Run roscore as the default command when the container starts
CMD ["roscore"]
