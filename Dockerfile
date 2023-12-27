# Use an official lightweight Node image
FROM node:alpine as builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application files to the working directory
COPY . .

# Build the production-ready application
RUN npm run build

# Use an official Nginx image as the final image
FROM nginx:alpine

# Copy the built files to the Nginx web root directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Command to run the application
CMD ["nginx", "-g", "daemon off;"]
