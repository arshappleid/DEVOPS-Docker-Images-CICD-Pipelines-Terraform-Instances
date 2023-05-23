# Use the official Ubuntu image as a base
FROM ubuntu:23.04

# Set environment variables 
ENV PORT=4000
ENV LINUX_USER=username

# Update packages and install necessary software
# Packages installed: git, sudo, net-tools, iproute2
RUN apt-get update && \
    apt-get install -y git sudo net-tools iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a new user with limited privileges and add them to the sudo group
RUN groupadd -r ${LINUX_USER} && \
    useradd -r -g ${LINUX_USER} ${LINUX_USER} && \
    usermod -aG sudo ${LINUX_USER}
    
RUN echo "${LINUX_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

## Change to the user , defined in environment variables
USER ${LINUX_USER}

# Expose the desired port
EXPOSE ${PORT}
# Start an interactive shell
CMD ["tail", "-f", "/dev/null"]
## Build the containor using : docker build -t linuxserver .
## Run the containor using : docker run -d -p local_port_num:4000 --name img_name linuxserver