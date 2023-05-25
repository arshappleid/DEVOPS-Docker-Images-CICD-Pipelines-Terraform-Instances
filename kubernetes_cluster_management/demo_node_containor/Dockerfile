# Use an official Node runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY ./node_app/package*.json ./

# Install any needed packages
RUN npm install

# Bundle app source
COPY ./node_app/. .

# Make port 8080 available to the outside world
EXPOSE 8080

# Run app.js when the container launches
CMD ["node", "app.js"]
