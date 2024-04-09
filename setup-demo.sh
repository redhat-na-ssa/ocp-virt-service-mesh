#!/bin/bash

# log in as user

oc new-project rest-api-with-mesh

# Adds project to the Service Mesh 
oc create -f k8/ServiceMeshMemberRole.yaml 

# Deploy Resources for initial setup
oc create -f k8/deploy-all.yaml
oc create -f k8/vm-template.yaml
oc create -f k8/virtualservice.yaml
oc create -f k8/gateway.yaml
oc create -f k8/virtualservice-service-b-VM1-to-v1-100-0.yaml
oc create -f k8/service-b-destination-rule.yaml


