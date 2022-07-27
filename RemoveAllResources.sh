#!/bin/bash



kubectl delete namespace dev --force --grace-period=0
kubectl delete namespace stage --force --grace-period=0

kubectl delete secret mssql --force --grace-period=0
kubectl delete -f app/mssql/deployment.yaml --force --grace-period=0



