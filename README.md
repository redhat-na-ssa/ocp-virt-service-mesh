# python-rest-api

uses environment variable to set the name of the service
`SERVICE_LOCAL` (default value is `"python-rest-api"`)   

exampple:   
`export SERVICE_LOCAL="my-api"`   

To build and run a container:  

```
podman build -t python-rest-api .
podman run -e SERVICE_LOCAL=$SERVICE_LOCAL -p 8000:8080 python-rest-api
```

This command runs the podman container, mapping port 8000 on your local machine to port 8080 in the podman container (which your FastAPI app should be listening on).  
  
## To test locally

If you're not already doing so, consider using a virtual environment. This isolates your project's dependencies from the global Python environment and can often resolve conflicts and dependency issues.  
  
```
python -m venv venv
source venv/bin/activate  # For Unix or MacOS
venv\Scripts\activate     # For Windows

pip install --upgrade pip
pip install -r requirements.txt

export SERVICE_LOCAL="my-api"

uvicorn main:app --reload
```

Note: If using OpenShift DevSpaces, there is no need to create a virtual environment (venv). Also no need to run pip install locally.

## To clean up python virtual environment
- If you are currently inside a virtual environment, you'll need to deactivate it first. You can do this by running the deactivate command in your terminal or command prompt.  

```
deactivate
```

This will return you to your system's default Python environment.  
  
Once you've deactivated the virtual environment, you can simply delete its directory to remove it completely. The virtual environment is just a directory containing all the necessary files, so removing this directory will delete the environment.

```
rm -rf venv  # Unix/Linux/MacOS
rmdir /s /q venv  # Windows
```
For some swagger action:

```
<url>/docs
<url>/redocs
```
