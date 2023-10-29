# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libjpeg-dev

# Install Python dependencies using Poetry
RUN pip install --no-cache-dir poetry \
    && poetry config virtualenvs.create false \
    && poetry install --no-root --no-interaction

# Expose the port that your application will run on
# (if applicable, remove or change this line based on your project)
EXPOSE 8000

# Define the command to run your application
# (update this based on how you start your project)
CMD [ "python", "app.py" ]
