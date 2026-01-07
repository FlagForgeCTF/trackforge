# 🐳 Docker Deployment Guide for TrackForge

This guide provides instructions for deploying **TrackForge** in a production-ready environment using **Docker Swarm**.

---

## 🏗️ Architecture Overview
The TrackForge stack consists of several interconnected services:
*   **Web**: The main Rails application.
*   **DB**: PostgreSQL database for persistent storage.
*   **RD**: Redis for ActionCable (real-time updates) and caching.
*   **WebConsole**: Integrated shell access for dynamic challenges.

---

## 🛠️ Prerequisites
1.  **Docker Swarm**: Ensure your Docker engine is in Swarm mode (`docker swarm init`).
2.  **Secrets**: TrackForge uses Docker Secrets for sensitive data in production.

---

## 🚀 Deployment Steps

### 1. Configure Environment Variables
Copy the sample environment file and set your production values:
```bash
cp .env_sample .env
```
**Crucial**: Generate a secure `SECRET_KEY_BASE` using `bundle exec rails secret`.

### 2. Deploy the Stack
Run the following command from the root directory to deploy the services:
```bash
docker stack deploy -c prod-stack.yml trackforge
```

### 3. Initialize the Database
Once the services are running, you need to migrate and seed the database. Find the container ID for the `web` service and run:
```bash
# Enter the web container
docker exec -it $(docker ps -q -f name=trackforge_web) /bin/sh

# Inside the container, run:
rails db:migrate
rails db:seed
rails assets:precompile
exit
```

---

## 🔒 Security Recommendations
*   **TLS/SSL**: This compose file does **not** include a reverse proxy with TLS. We highly recommend using **Nginx**, **Traefik**, or **Caddy** to handle HTTPS.
*   **Docker Socket**: The web service requires access to `/var/run/docker.sock` to manage dynamic challenge containers. Ensure this is only accessible to authorized services.

---

## 🌐 Accessing the Platform
After deployment, TrackForge will be accessible on **port 3000** of any node in your Swarm cluster.

---
*For more information, visit the main [README.md](README.md).*
