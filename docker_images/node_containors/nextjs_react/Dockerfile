# Stage 1: Build the app
FROM node:18-alpine3.17 AS builder
WORKDIR /app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install exact dependencies , and only install production dependencies
RUN npm ci --production
# Copy the source code
COPY . .
# Build the app
RUN npm run build

# Stage 2: Create a production-ready image
FROM node:18-alpine3.17
WORKDIR /app
# Config nextjs app accordingly : https://nextjs.org/docs/pages/api-reference/next-config-js/output
# Copy built files from the previous stage
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
# Set environment variables
ENV NODE_ENV=production
ENV PORT=4000
EXPOSE ${PORT}
# Start the Next.js app
CMD ["node", "server.js"]
