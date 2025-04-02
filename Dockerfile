# This Dockerfile is for building a Docker image for a Python application.
# It uses the official Python 3.12.3 slim image based on Debian Bullseye as the base image.
FROM python:3.12.3-slim-bullseye

#Set an environment variable to ubuffer python output, aiding logging and debugging.
ENV PYTHONBUFFERED=1

#Define an environment variable for the web service's port
ENV PORT=8000

#Set the working directory to /app
WORKDIR /app

#Copy the entire current directory contents into the container at /app
COPY . /app/

#upgrade pip to the latest version
RUN pip install --upgrade pip

#Install the dependencies listed in requirements.txt
RUN pip install -r requirements.txt

#Set the command to run the web service using gunivorn and binding it to 0.0.0.0:"${PORT}"

CMD gunicorn server.wsgi:application --bind 0.0.0.0:"${PORT}"


#Tell Docker that the container listens on the specifiend network port at runtime
EXPOSE ${PORT}
