# Use Node.js LTS version
FROM node:18

# Set environment to production
ENV NODE_ENV=${NODE_ENV}

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first for efficient caching
COPY ["package.json", "package-lock.json", "./"]

# Install production dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]