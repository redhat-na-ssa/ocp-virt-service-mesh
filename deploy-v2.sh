oc apply -f k8/virtualservice-service-b-100-0.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-90-10.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-75-25.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-50-50.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-25-75.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-10-90.yaml
sleep 20
oc apply -f k8/virtualservice-service-b-0-100.yaml



