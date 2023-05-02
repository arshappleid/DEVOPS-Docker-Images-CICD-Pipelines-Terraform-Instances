# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Set environment variables 



# Update packages and install necessary software
# Packages installed: git, sudo, net-tools, iproute2
RUN apt-get update && \
    apt-get install -y git sudo net-tools iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose the desired port
EXPOSE 5000

# Start an interactive shell
CMD ["/bin/bash"]
