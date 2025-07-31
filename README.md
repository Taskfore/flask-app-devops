# Flask App DevOps

A containerized Flask application with PostgreSQL, automated CI/CD via GitHub Actions, and deployment to GitHub Container Registry (GHCR).

---

## Overview

This project demonstrates how to:

- Containerize a Flask app using Docker and Docker Compose  
- Connect the app to a PostgreSQL database with persistent storage  
- Automate builds and pushes to GHCR with GitHub Actions  
- Run the app locally either by building from source or pulling a prebuilt image  

---

## Prerequisites

- Git  
- Docker & Docker Compose  
- Docker Desktop (Windows/macOS) or Docker Engine & Docker Compose (Linux)  
- curl or Git Bash for testing API endpoints  

---

## Local Setup: Build from Cloned Repository

1. Clone the repository:

   ```bash
   git clone https://github.com/northernblues/flask-app-devops.git
   cd flask-app-devops
   ```

2. Add the environment file:  
   Place the provided `.env` file in the project root directory.

3. Prepare Docker:

   - **Windows**: Open Docker Desktop and ensure it's running.
   - **Linux**: Ensure Docker Engine and Docker Compose are installed, and your user can run Docker commands (via `sudo` or Docker group).

4. Build and start containers:

   ```bash
   docker-compose build
   docker-compose up -d
   ```

5. View logs (optional):

   ```bash
   docker-compose logs -f
   ```

6. Verify health check:  
   Open your browser and go to:

   ```
   http://localhost:5000
   ```

   You will be redirected to `/health`, which should show `OK`.

7. Add a user (via curl):

   ```bash
   curl -X POST http://localhost:5000/users      -H "Content-Type: application/json"      -d '{"name": "Alice", "email": "alice@example.com"}'
   ```

8. View users:  
   Go to:

   ```
   http://localhost:5000/users
   ```

---

## Local Setup: Run Prebuilt Image from GHCR

1. Download the `.env` file:  
   Place the provided `.env` (or `local.env`) in a folder of your choice.

2. Pull the Docker image:

   ```bash
   docker pull ghcr.io/northernblues/flask-app-devops:main
   ```

3. Start PostgreSQL container:

   ```bash
   docker run -d \
     --name db \
     -e POSTGRES_USER=user \
     -e POSTGRES_PASSWORD=password \
     -e POSTGRES_DB=appdb \
     -p 5432:5432 \
     postgres:15
   ```

4. Run the Flask app container:

   ```bash
   docker run -p 5000:5000 \
     --env-file local.env \
     --link db:db \
     ghcr.io/northernblues/flask-app-devops:main
   ```

5. Verify health check:

   ```
   http://localhost:5000
   ```

   You should see `OK` at `/health`.

---

## API Endpoints

- `GET /health` – Health check (returns 200 OK)
- `POST /users` – Create a user  
  Example:
  ```bash
  curl -X POST http://localhost:5000/users \
    -H "Content-Type: application/json" \
    -d '{"name": "Bob", "email": "bob@example.com"}'
  ```
- `GET /users` – List all users
- `GET /users/<id>` – Get user by ID

---

## Additional Info

- Flask app runs under a **non-root user** for security.
- Secrets are stored in a `.env` file that is **not committed** to version control.
- PostgreSQL uses a **Docker volume** to persist data across container restarts.
- GitHub Actions handles **CI/CD**, automatically building and pushing to GHCR on each push to `main`.
