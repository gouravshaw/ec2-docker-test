# Use nginx alpine for a lightweight image
FROM nginx:alpine

# Copy the web app to nginx's default directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
