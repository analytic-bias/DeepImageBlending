# Use an official Python runtime as a parent image
FROM nvcr.io/nvidia/pytorch:23.10-py3

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

# Define the command to run your application
# (update this based on how you start your project)
CMD [ "python", "app.py" ]
