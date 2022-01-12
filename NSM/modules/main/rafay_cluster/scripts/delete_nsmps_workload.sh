nsmps_workload="$2"

cluster_name="$3"

rest_endpoint="$4"
ops_endpoint="$5"
api_key="$6"
api_secret="$7"
project_name="$8"
export RCTL_REST_ENDPOINT="${rest_endpoint}"
export RCTL_OPS_ENDPOINT="${ops_endpoint}"
export RCTL_API_KEY="${api_key}"
export RCTL_API_SECRET="${api_secret}"
export RCTL_PROJECT="${project_name}"
export RCTL_SKIP_SERVER_CERT_VALIDATION="true"

#unpublish istio-base workload
NSMPS_WORKLOAD=`cat ${nsmps_workload} | grep name| head -1|cut -d ":" -f2`
/opt/rafay/RCTL/rctl unpublish workload $NSMPS_WORKLOAD
if [ $? -eq 0 ];then
    echo -e workload $NSMPS_WORKLOAD unpublished successfully
else
    echo -e failed to unpublish workload $NSMPS_WORKLOAD && exit -1
fi
sleep 10

#delete workloads
/opt/rafay/RCTL/rctl delete workload $NSMPS_WORKLOAD
if [ $? -eq 0 ];then
    echo -e workload $NSMPS_WORKLOAD deleted successfully
else
    echo -e failed to delete workload $NSMPS_WORKLOAD  && exit -1
fi

