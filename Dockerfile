# Base image
FROM ubuntu:22.04

# Install a simple package for demo
RUN apt-get update && apt-get install -y curl

# Define a default command
CMD ["echo", "Hello from Docker built by Jenkins!"]
