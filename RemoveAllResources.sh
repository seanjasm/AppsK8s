#!/bin/bash



kubectl delete namespace dev --force --grace-period=0
kubectl delete -f app/nextstore/stage/deployment.yaml --force --grace-period=0
kubectl delete -f app/nextstore/dev/deployment.yaml --force --grace-period=0

kubectl delete ns staging dev
kubectl delete secret mssql --force --grace-period=0
kubectl delete -f app/mssql/deployment.yaml --force --grace-period=0



