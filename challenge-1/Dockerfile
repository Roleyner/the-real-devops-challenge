# Use the official Python image from the Docker Hub
FROM python:3.9-alpine

# Create a non-root user and group
RUN addgroup -S myapp && adduser -S myapp -G myapp

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any necessary packages and clean up
RUN apk update && apk add --no-cache \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc /var/cache/ldconfig/aux-cache

# Change ownership of the app directory to the non-root user
RUN chown -R myapp:myapp /app

# Switch to the non-root user
USER myapp

# Set the entrypoint to the script
ENTRYPOINT ["./entrypoint.sh"]

# Default command to pass to the entrypoint
CMD ["--host", "0.0.0.0", "--port", "8000"]
