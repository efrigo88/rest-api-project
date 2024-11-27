FROM python:3.10

# Install system packages
RUN apt-get update && apt-get install -y postgresql-client netcat-openbsd

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY . .

# Ensure the entrypoint script has execute permissions
RUN chmod +x docker-entrypoint.sh

CMD ["/bin/bash", "docker-entrypoint.sh"]