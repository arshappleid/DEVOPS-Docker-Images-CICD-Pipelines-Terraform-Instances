
FROM node:18-alpine3.17
ENV PORT=4000
# Set working directory
WORKDIR /app
# Copy project file
COPY package*.json ./ 
RUN npm install --legacy-peer-deps

# Once all the packages have been successfully installed , import rest of the files into the working directory
COPY . .
# Expose port
EXPOSE ${PORT}
# Start the application , on reacts in built server
CMD ["npm", "start"]
