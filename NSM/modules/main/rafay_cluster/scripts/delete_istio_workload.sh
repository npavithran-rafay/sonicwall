istio_base_workload="$2"
istiod_workload="$3"

cluster_name="$4"

rest_endpoint="$5"
ops_endpoint="$6"
api_key="$7"
api_secret="$8"
project_name="$9"
export RCTL_REST_ENDPOINT="${rest_endpoint}"
export RCTL_OPS_ENDPOINT="${ops_endpoint}"
export RCTL_API_KEY="${api_key}"
export RCTL_API_SECRET="${api_secret}"
export RCTL_PROJECT="${project_name}"
export RCTL_SKIP_SERVER_CERT_VALIDATION="true"

#unpublish istio-base workload
ISTIO_BASE_WORKLOAD=`cat ${istio_base_workload} | grep name| head -1|cut -d ":" -f2`
/opt/rafay/RCTL/rctl unpublish workload $ISTIO_BASE_WORKLOAD
if [ $? -eq 0 ];then
    echo -e workload $ISTIO_BASE_WORKLOAD unpublished successfully
else
    echo -e failed to unpublish workload $ISTIO_BASE_WORKLOAD && exit 0
fi
sleep 10
#unpublish istiod workload
ISTIOD_WORKLOAD=`cat ${istiod_workload} | grep name| head -1|cut -d ":" -f2`
/opt/rafay/RCTL/rctl unpublish workload $ISTIOD_WORKLOAD
if [ $? -eq 0 ];then
    echo -e workload $ISTIOD_WORKLOAD unpublished successfully
else
    echo -e failed to unpublish workload $ISTIOD_WORKLOAD && exit 0
fi
sleep 10
#delete workloads
/opt/rafay/RCTL/rctl delete workload $ISTIO_BASE_WORKLOAD
if [ $? -eq 0 ];then
    echo -e workload $ISTIO_BASE_WORKLOAD deleted successfully
else
    echo -e failed to delete workload $ISTIO_BASE_WORKLOAD  && exit 0
fi
sleep 10
/opt/rafay/RCTL/rctl delete workload $ISTIOD_WORKLOAD
if [ $? -eq 0 ];then
    echo -e workload $ISTIOD_WORKLOAD deleted successfully
else
    echo -e failed to delete workload $ISTIOD_WORKLOAD  && exit 0
fi

