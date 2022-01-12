#!/bin/bash
import_cluster_yml="$1"
CLUSTER_NAME="$2"

rest_endpoint="$3"
ops_endpoint="$4"
api_key="$5"
api_secret="$6"
project_name="$7"


export RCTL_REST_ENDPOINT="${rest_endpoint}"
export RCTL_OPS_ENDPOINT="${ops_endpoint}"
export RCTL_API_KEY="${api_key}"
export RCTL_API_SECRET="${api_secret}"
export RCTL_PROJECT="${project_name}"
export RCTL_SKIP_SERVER_CERT_VALIDATION="true"

# echo $RCTL_REST_ENDPOINT
# echo $RCTL_OPS_ENDPOINT
# echo $RCTL_API_KEY
# echo $RCTL_API_SECRET
# echo $RCTL_PROJECT

# exit 0
/opt/rafay/RCTL/rctl create cluster imported -f ${import_cluster_yml} > /tmp/import_cluster.out 2>&1
if [ $? -eq 0 ];
then
    echo "[+] Successfully Created cluster ${CLUSTER_NAME}"
fi

/opt/rafay/RCTL/kubectl --kubeconfig /tmp/kube/config apply -f /tmp/import_cluster.out 
if [ $? -eq 0 ];
then
    echo "[+] Successfully applied the cluster ${CLUSTER_NAME} provision yaml"
fi

CLUSTER_STATUS_ITERATIONS=1
CLUSTER_HEALTH_ITERATIONS=1
CLUSTER_STATUS=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json |jq '.status'|cut -d'"' -f2`
while [ "${CLUSTER_STATUS}" != "READY" ]
do
  sleep 30
  if [ $CLUSTER_STATUS_ITERATIONS -ge 50 ];
  then
    break
  fi
  CLUSTER_STATUS_ITERATIONS=$((CLUSTER_STATUS_ITERATIONS+1))
  CLUSTER_STATUS=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json |jq '.status'|cut -d'"' -f2`
  if [ "${CLUSTER_STATUS}" == "PROVISION_FAILED" ];
  then
    echo -e " !! Cluster provision failed !!  "
    echo -e " !! Exiting !!  " && exit 0
  fi

  PROVISION_STATUS=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json |jq '.provision.status' |cut -d'"' -f2`

  if [ "${PROVISION_STATUS}" == "INFRA_CREATION_FAILED" ];
  then
    echo -e " !! Cluster provision failed !!  "
    echo -e " !! Exiting !!  " && exit 0
  fi

  if [ "${PROVISION_STATUS}" == "BOOTSTRAP_CREATION_FAILED" ];
  then
    echo -e " !! Cluster provision failed !!  "
    echo -e " !! Exiting !!  " && exit 0
  fi

  PROVISION_STATE=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json | jq '.provision.running_state' |cut -d'"' -f2`
  echo "$PROVISION_STATE in progress"
done
if [ "${CLUSTER_STATUS}" != "READY" ];
then
    echo -e " !! Cluster provision failed !!  "
    echo -e " !! Exiting !!  " && exit 0
fi
if [ "${CLUSTER_STATUS}" == "READY" ];
then
    echo "[+] Cluster Provisioned Successfully waiting for it to be healthy"
    CLUSTER_HEALTH=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json | jq '.health' |cut -d'"' -f2`
    while [ $CLUSTER_HEALTH != 1 ]
    do
      echo "Iteration-${CLUSTER_HEALTH_ITERATIONS} : Waiting 60 seconds for cluster to be healthy..."
      sleep 30
      if [ $CLUSTER_HEALTH_ITERATIONS -ge 15 ];
      then
        break
      fi
      CLUSTER_HEALTH_ITERATIONS=$((CLUSTER_HEALTH_ITERATIONS+1))
      CLUSTER_HEALTH=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json | jq '.health' |cut -d'"' -f2`
    done
fi

if [[ $CLUSTER_HEALTH == 0 ]];
then
    echo -e " !! Cluster is not healthy !!  "
    echo -e " !! Exiting !!  " && exit 0 #exit 0 for terraform exit -1 for other automation tools
fi
if [[ $CLUSTER_HEALTH == 1 ]];
then
    echo "[+] Cluster Provisioned Successfully and is Healthy"
    # echo "[+] Downloading cluster $CLUSTER_NAME kubeconfig file"
    # /opt/rafay/RCTL/rctl download kubeconfig --cluster $CLUSTER_NAME > ./$CLUSTER_NAME.kubeconfig
    # if [ $? -eq 0 ];then
    #     echo kubeconfig file for cluster $CLUSTER_NAME downloaded successfully
    # else
    #     echo something went wrong while downloading the kubeconfig file for cluser $CLUSTER_NAME
    # fi
fi