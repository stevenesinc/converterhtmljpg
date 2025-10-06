cd html-to-image-service

# Create Dockerfile
cat > Dockerfile << 'EOF'
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
EOF

# Update requirements.txt to simpler version
cat > requirements.txt << 'EOF'
flask==3.0.0
flask-cors==4.0.0
gunicorn==21.2.0
playwright==1.47.0
pillow==10.1.0
EOF

# Commit and push
git add Dockerfile requirements.txt
git commit -m "Switch to Docker for Playwright compatibility"
git push
