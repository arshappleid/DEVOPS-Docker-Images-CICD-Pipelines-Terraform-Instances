# The docker file should be in inside the Client_App folder , which has all the src/components files.

## Create a NODE docker containor 
FROM node:18-alpine3.17

# Set environment variables for Node.js version and Angular CLI version
ENV ANGULAR_CLI_VERSION=14.2.11
ENV PORT=4000

## Set the working director name to app
WORKDIR /app
# create a folder app , and all the RUN commands will be executed in this working directory
COPY package*.json ./ 
# into the working_directory copy package.json file
# also done individually for efficiency
RUN npm install --legacy-peer-deps
RUN npm npm i -g @angular/cli@${ANGULAR_CLI_VERSION}

# Once all the packages have been successfully installed , import rest of the files into the working directory
COPY . .

# Expose the desired port
EXPOSE ${PORT}

# For development
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4000"]
# For production
# CMD["ng","build","--prod"]


# Build the image using : docker build -t angular_AppName .
# Build a containor using : docker run -d -p local_port_name:4000 --name frontend1 angular_AppName