# Use Python 3.13 as the base image
FROM python:3.13

# Set the working directory in the container
WORKDIR /app

# Copy all files from the current directory into the container
COPY . .

# Install Gunicorn web server
RUN pip install gunicorn

# Install all Python dependencies listed in requirements.txt
RUN pip install -r requirements.txt

# Set environment variable for the port
ENV PORT=80

# Run the web app with Gunicorn
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app

