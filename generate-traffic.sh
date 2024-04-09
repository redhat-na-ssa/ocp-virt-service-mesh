#!/bin/bash

export GATEWAY=$(oc get route istio-ingressgateway -n istio-system -o template --template '{{ .spec.host }}')

while true
do 
  curl $GATEWAY/hello-service
  echo ""
  echo ""
  sleep 1
done