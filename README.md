# TeamMooseJaw
Group repository for v3

# Open Powershell and enter WSL
wsl

# Start server virtual environment 
python3 -m venv venv
source venv/bin/activate
 
# Start Docker build
docker build -t django-docker:latest .
docker run -d -p 8000:8000 django-docker:latest

# Verify that the container is running
docker ps

# We can find the django app at http://localhost:8000/