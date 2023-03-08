# Node js version
FROM node:18
# Create app directory
WORKDIR /app
# Copy package.json
COPY package*.json .
# Set environment variable. Takes value from Dockerfile args
ARG NODE_ENV
# Install dependencies
RUN if [ "$NODE_ENV" = "local" ]; \
    then npm install; \
    else npm install --only=production; \
    fi
# Copy source code
COPY . .
# Environment variables
ENV PORT 8080
# Expose port
EXPOSE $PORT
# Run app
CMD [ "npm", "run", "dev" ]