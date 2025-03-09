#!/bin/bash

read -p "Server Name: " servername
read -p "DB Name: " Dbname
read -p "username: " sqlUser
read -p "password: " password

alias k=kubectl
alias kg='kubectl get'
alias kd='kubectl get deployment'
alias ks='kubectl get svc'
alias kp='kubectl get pods'
alias kx='kubectl describe'


kubectl create namespace dev
kubectl create namespace stage

kubectl create secret generic mysql --from-literal=PASSWORD=$mysqlpw

kubectl apply -f app/mssql/mysqlDep.yaml 

sed -i "s/PassW/$password/" appsettings.json

sed -i "s/Server/$servername/" appSettingShopping.json
sed -i "s/DBname/$Dbname/" appSettingShopping.json
sed -i "s/PassW/$UserName/" appSettingShopping.json
sed -i "s/Password/$password/" appSettingShopping.json


kubectl create secret generic secret-appsettings --namespace=dev --from-file=appsettings.json
kubectl create secret generic secret-appsettings-shopping --namespace=dev --from-file=appSettingShopping.json
kubectl create secret generic secret-appsettings --namespace=stage --from-file=appsettings.json

kubectl apply -f app/nextstore/dev 

kubectl apply -f app/nextstore/stage 




