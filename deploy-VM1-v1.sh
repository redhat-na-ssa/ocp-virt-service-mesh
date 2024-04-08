oc apply -f k8/virtualservice-service-b-VM1-to-v1-100-0.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-90-10.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-75-25.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-50-50.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-25-75.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-10-90.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-0-100.yaml



