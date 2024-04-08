#!/bin/bash


kubectl delete ns stage dev
kubectl delete -f app/mssql/deployment.yaml --force --grace-period=0
kubectl delete secret mssql --force --grace-period=0



