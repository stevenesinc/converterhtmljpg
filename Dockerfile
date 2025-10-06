FROM mcr.microsoft.com/playwright/python:v1.47.0-jammy

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application
COPY app.py .

# Playwright browsers are already in the base image
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

EXPOSE 5000

CMD gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 app:app

