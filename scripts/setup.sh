#!/bin/bash

echo "Setting up environment..."

# Install dependencies from requirements.txt
pip install -r requirements.txt

echo "Initializing database..."
export FLASK_APP=app.py

# This command requires Flask-Migrate or you can replace with your own DB init logic
# If you don’t have migrations, you can skip this or just create tables in Python
flask db upgrade || echo "DB init skipped (no migrations found)"

echo "Setup complete."
