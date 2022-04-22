#!/bin/bash



kubectl delete namespace dev
kubectl delete namespace stage

kubectl delete secret mssql 
kubectl delete -f app/mssql/deployment.yaml 



