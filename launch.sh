#!/bin/bash

read -p "mssql-password: " mysqlpw
#read -p "msssql-user: " mssqluser

alias k=kubectl
alias kg='kubectl get'
alias kd='kubectl get deployment'
alias ks='kubectl get svc'
alias kp='kubectl get pods'
alias kx='kubectl describe'


kubectl create namespace dev
kubectl create namespace stage

kubectl create secret generic mysql --from-literal=PASSWORD=$mysqlpw

kubectl apply -f app/mssql/deployment.yaml 

sed -i "s/PassW/$mysqlpw/" appsettings.json


kubectl create secret generic secret-appsettings --namespace=dev --from-file=appsettings.json

kubectl create secret generic secret-appsettings --namespace=stage --from-file=appsettings.json

kubectl apply -f app/nextstore/dev 

kubectl apply -f app/nextstore/stage 




