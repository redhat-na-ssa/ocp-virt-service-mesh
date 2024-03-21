import os
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
service_local = os.getenv('SERVICE_LOCAL', 'python-rest-api')
service_remote = os.getenv('SERVICE_REMOTE', 'python-rest-api')

@app.get("/")
async def usage():
    return {"message": "See /docs for API usage"}

@app.get("/hello")
def read_hello():
    # Return a JSON object with the key "message" and value "Hello World"
    return {"message": "Hello World from " + service_local}