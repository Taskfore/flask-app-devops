# Dockerfile
FROM python:3.11-slim


ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


WORKDIR /app


# system deps for psycopg2
RUN apt-get update && apt-get install -y --no-install-recommends \
build-essential \
libpq-dev \
&& rm -rf /var/lib/apt/lists/*


# install python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# copy app
COPY . .


EXPOSE 5000


# Use gunicorn in container for production-like run
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
