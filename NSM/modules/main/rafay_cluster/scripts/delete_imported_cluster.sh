#!/bin/bash

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

/opt/rafay/RCTL/rctl delete cluster ${CLUSTER_NAME} -y
if [ $? -eq 0 ];
then
    echo "[-] Successfully deleted cluster ${CLUSTER_NAME}"
fi

CLUSTER_STATUS_ITERATIONS=1
CLUSTER_STATUS=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json |jq '.provision.status'|cut -d'"' -f2`
while [ "${CLUSTER_STATUS}" == "INFRA_DELETION_INPROGRESS" ]
do
  sleep 30
  echo "Cluster $CLUSTER_STATUS"
  if [ $CLUSTER_STATUS_ITERATIONS -ge 50 ];
  then
    break
  fi
  CLUSTER_STATUS_ITERATIONS=$((CLUSTER_STATUS_ITERATIONS+1))
  CLUSTER_STATUS=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json |jq '.provision.status'|cut -d'"' -f2`
  if [ "${CLUSTER_STATUS}" == "INFRA_DELETION_FAILED" ];
  then
    echo -e " !! Cluster infra deletion failed !!  "
    echo -e " !! Exiting !!  " && exit 0
  fi
  CLUSTER_STATUS=`/opt/rafay/RCTL/rctl get cluster ${CLUSTER_NAME} -o json |jq '.provision.status'|cut -d'"' -f2`
  if [ "${CLUSTER_STATUS}" == "INFRA_DELETION_COMPLETE" ];
  then
    echo -e " !! Cluster infra deletion completed !!  "
    echo -e " !! Exiting !!  " && exit 0
  fi
done

