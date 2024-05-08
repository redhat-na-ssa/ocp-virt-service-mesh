#!/bin/bash

export GATEWAY=$(oc get route istio-ingressgateway -n istio-system -o template --template '{{ .spec.host }}')
export SLEEP=1

while true
do 
  date
  curl $GATEWAY/web/hello-service
  echo ""
  echo ""
  sleep $SLEEP
done
