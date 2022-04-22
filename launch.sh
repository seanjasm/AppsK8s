#!/bin/bash

read -p "mssql-password: " mssqlpw
#read -p "msssql-user: " mssqluser

alias k=kubectl
alias kg='kubectl get'
alias kd='kubectl get deployment'
alias ks='kubectl get svc'
alias kp='kubectl get pods'
alias kx='kubectl describe'


kubectl create namespace dev
kubectl create namespace staging

kubectl create secret generic mssql --from-literal=SA_PASSWORD=$mssqlpw

kubectl apply -f app/mssql/deployment.yaml --record

sed -i "s/PassW/$mssqlpw/" appsettings.json


kubectl create secret generic secret-appsettings --namespace=dev --from-file=appsettings.json

kubectl create secret generic secret-appsettings --namespace=staging --from-file=appsettings.json

kubectl apply -f app/nextstore/dev 

kubectl apply -f app/nextstore/stage 




