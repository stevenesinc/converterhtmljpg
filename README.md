A Flask-based microservice that converts HTML to images using Playwright.

## Features

- 🎨 Converts HTML to high-quality JPEG images
- 🚀 Full-page screenshot support
- 📦 Returns base64-encoded images
- 🔧 Configurable image quality
- ✅ Health check endpoint

## API Endpoints

### `GET /`
Service information and available endpoints.

### `GET /health`
Health check endpoint.

### `POST /convert`
Convert HTML to image.

**Request Body:**
```json
{
  "html": "<html>...</html>",
  "quality": 90
}
```

**Response:**
```json
{
  "success": true,
  "data": "base64_encoded_image...",
  "file_size": 123456,
  "mime_type": "image/jpeg"
}
```

## Local Development

```bash
# Install dependencies
pip install -r requirements.txt
playwright install chromium

# Run server
python app.py
```

## Deploy to Render.com

1. Push this repo to GitHub
2. Go to [Render.com](https://render.com)
3. Click "New +" → "Web Service"
4. Connect your GitHub repository
5. Render will auto-detect `render.yaml` and deploy!

## Environment Variables

- `PORT` - Server port (default: 5000)

## Tech Stack

- Flask - Web framework
- Playwright - Browser automation
- Pillow - Image processing
- Gunicorn - Production server
