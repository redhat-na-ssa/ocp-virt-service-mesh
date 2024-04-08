oc apply -f k8/virtualservice-service-b-VM1-to-v1-100-0.yaml
echo "all traffic is routed to VM1"
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-90-10.yaml
echo "90% traffic is routed to VM1 10% to pod"
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-75-25.yaml
echo "75% traffic is routed to VM1 25% to pod"
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-50-50.yaml
echo "50% traffic is routed to VM1 50% to pod"
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-25-75.yaml
echo "25% traffic is routed to VM1 75% to pod"
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-10-90.yaml
echo "10% traffic is routed to VM1 90% to pod"
sleep 20
oc apply -f k8/virtualservice-service-b-VM1-to-v1-0-100.yaml
echo "All traffic is routed to pod"



