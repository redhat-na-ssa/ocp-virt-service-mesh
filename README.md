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

You can use the yaml files found in the k8 directory:
- `k8/deploy-all` will deploy two containers using this code that I have pushed to a public registry
- `k8/deploy-serviceb-v2-yaml` will deploy a v2 tagged container of service b (to test load balancing and service mesh)  

```
oc create -f k8/deploy-all.yaml

oc create -f k8/deploy-serviceb-v2.yaml
```


For some swagger action:

```
<url>/docs
<url>/redocs
```
# Service Mesh stuff
- Create the serive mesh in the 'istio-system' namespace (as dev/user)
- Add the project/namespace with the mesh enabled pods to the ServiceMeshMemberRole (can be done in OpenShift web terminal)
- Create a gateway in the app namespace (use `gateway.yaml` as an example)
- Create VirtualService (use `virtualservice.yaml` as an example) this add

```
oc get gw,vs                    
NAME                                        AGE
gateway.networking.istio.io/hello-gateway   5m23s

NAME                                          GATEWAYS            HOSTS   AGE
virtualservice.networking.istio.io/hello-vs   ["hello-gateway"]   ["*"]   49s
```

- now you should be able to access the service through the ingress gatway

```
oc get route istio-ingressgateway -n istio-system                    
NAME                   HOST/PORT                 
istio-ingressgateway   istio-ingressgateway-istio-system.apps.<domain>  
```

- same for other services like kiali


```
NAME    HOST/PORT                        
kiali   kiali-istio-system.apps.<domain> 
```

- access the API through the gateway

```
curl istio-ingressgateway-istio-system.apps.cluster-b5pcr.dynamic.redhatworkshops.io/hello
{"message":"Hello World from service-a"}

❯ curl istio-ingressgateway-istio-system.apps.cluster-b5pcr.dynamic.redhatworkshops.io/hello-service
{"response":{"message":"Hello World from service-b-v1"}}
```
- TODO: Network shaping between releases