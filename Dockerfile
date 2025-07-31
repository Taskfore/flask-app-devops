# Stage 1 - Builder 
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

# Install dependencies to /install folder
RUN pip install --prefix=/install --no-cache-dir -r requirements.txt


# Stage 2: Runtime
FROM python:3.11-slim


RUN adduser --disabled-password appuser

WORKDIR /app

# Copy installed packages from builder stage
COPY --from=builder /install /usr/local

# Copy the app source code
COPY . .

# Use non-root user
USER appuser

ENV FLASK_ENV=production
ENV PORT=5000

EXPOSE 5000

# Docker health check (checks if app is running)
HEALTHCHECK CMD curl --fail http://localhost:5000/health || exit 1

# Command to run the app using gunicorn WSGI server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
