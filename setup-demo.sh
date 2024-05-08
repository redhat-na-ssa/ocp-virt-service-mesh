#!/bin/bash

# log in as user

oc new-project rest-api-with-mesh

# Adds project to the Service Mesh 
oc apply -f k8/ServiceMeshMemberRole.yaml 

# Deploy Resources for initial setup
oc create -f k8/deploy-all.yaml -n rest-api-with-mesh
oc create -f k8/vm-template.yaml -n rest-api-with-mesh
oc create -f k8/virtualservice.yaml -n rest-api-with-mesh
oc create -f k8/gateway.yaml -n istio-system
oc create -f k8/virtualservice-service-b-VM1-to-v1-100-0.yaml -n rest-api-with-mesh
oc create -f k8/service-b-destination-rule.yaml -n rest-api-with-mesh

# Deploy all VM stack in separate project vm-to-vm
oc new-project vm-to-vm
oc apply -f k8/vm/vm-template.yaml -n vm-to-vm
oc apply -f k8/vm/services.yaml -n vm-to-vm
oc apply -f k8/vm/virtualservice.yaml -n vm-to-vm
oc apply -f k8/vm/gateway.yaml -n vm-to-vm
oc apply -f k8/vm/destination-rule.yaml -n vm-to-vm


