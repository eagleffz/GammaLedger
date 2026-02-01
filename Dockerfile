FROM node:18-alpine

# Workspace directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json ./
RUN npm install

# Copy source code and server scripts
COPY src/ ./src/
COPY server.js .

# Create data directory for persistence
RUN mkdir -p data

# Expose port
EXPOSE 8080

# Start server
CMD ["npm", "start"]