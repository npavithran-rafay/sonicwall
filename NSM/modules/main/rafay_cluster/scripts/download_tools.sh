#!/bin/bash

region="$1"
cluster_name="$2"

#installing rctl
sudo mkdir -p /opt/rafay/RCTL/
sudo chmod -R 0755 /opt/rafay/RCTL/
sudo curl -s -o /opt/rafay/RCTL/rctl-linux-amd64.tar.bz2 https://s3-us-west-2.amazonaws.com/rafay-prod-cli/publish/rctl-linux-amd64.tar.bz2 
sudo tar -xf /opt/rafay/RCTL/rctl-linux-amd64.tar.bz2 --directory /opt/rafay/RCTL/ 
sudo chmod 0755 /opt/rafay/RCTL/rctl

#installing kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /opt/rafay/RCTL/kubectl 

#installing aws cli to download cluster kubeconfig file
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/opt/rafay/RCTL/awscliv2.zip"
sudo unzip /opt/rafay/RCTL/awscliv2.zip -d /opt/rafay/RCTL/
sudo /opt/rafay/RCTL/aws/install 

#downloading aws-iam-authenticator
sudo curl -o /opt/rafay/RCTL/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
sudo chmod +x /opt/rafay/RCTL/aws-iam-authenticator
sudo mv /opt/rafay/RCTL/aws-iam-authenticator /usr/local/bin/ 
#downloading cluster kubeconfig file if it is not provided
sudo mkdir -p $HOME/.kube
aws eks update-kubeconfig --region $region --name $cluster_name
