import os
import requests
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)

# Get the environment variable 'SERVICE_LOCAL', set to 'python-rest-api' if it doesn't exist
service_local = os.getenv('SERVICE_LOCAL', 'python-rest-api-a')
service_remote = os.getenv('SERVICE_REMOTE', 'python-rest-api-b')

@app.get("/")
async def usage():
    return {"message": "See /docs for API usage"}

@app.get("/hello")
async def read_hello():
    # Return a JSON object with the key "message" and value "Hello World"
    return {"message": "Hello World from " + service_local}

@app.get("/hello-service")
async def read_hello():
    url = "http://" + service_remote + ":8080/hello"

    headers = {
    'Content-Type': 'application/json'
    }

    response = requests.get(url, headers=headers)

    return {"response": response.json()}