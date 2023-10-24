# Start from the official Node.js 14 LTS release
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and yarn.lock into the root directory
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy the rest of the code
COPY . .

# Build the app
RUN yarn build

# Expose the listening port
EXPOSE 1337

# Command to run the app
CMD [ "yarn", "start" ]