# ==== CONFIGURE =====
# Use a Node 16 base image
FROM node:10
# Set the working directory to /app inside the container
RUN mkdir -p /usr
WORKDIR /usr
# Copy app files
COPY . .
# ==== BUILD =====
# Install dependencies
RUN npm install
# Build the app
RUN npm run build
# ==== RUN =======
# Set the env to "production"
ENV NODE_ENV production
# Expose the port on which the app will be running (3000 is the default that `serve` uses)
EXPOSE 3000
# Start the app
CMD [ "npm", "start" ]