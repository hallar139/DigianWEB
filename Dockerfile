# Use an official Nginx image as the base image
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the HTML and CSS files to the working directory
COPY index.html .
COPY contact.html .
COPY about.html .
COPY service.html .
COPY css/bootstrap.css .
COPY css/font-awesome.min.css .
COPY css/responsive.css .
COPY css/style.css .
COPY css/style.scss .
COPY css/style.css.map .

# Expose port 80
EXPOSE 80

# Command to run the Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]
