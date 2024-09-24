#!/bin/bash


kubectl delete ns stage dev
kubectl delete -f app/mssql/deployment.yaml --force --grace-period=0
kubectl delete -f app/mssql/mysqlDep.yaml --force --grace-period=0
kubectl delete secret mysql --force --grace-period=0



