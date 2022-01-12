
NAMESPACE_YAML="$1"
NSMPS_YAML="$2"

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

#create istio-system namespace
NSMPS_NS=`cat ${NAMESPACE_YAML} | grep name|cut -d ':' -f2`
/opt/rafay/RCTL/rctl create ns -f ${NAMESPACE_YAML}
if [ $? -eq 0 ];then
    echo -e " namespace $NSMPS_NS created successfully"
else
    echo -e " failed to create namespace $NSMPS_NS"  && exit -1
fi
#publish namespace
/opt/rafay/RCTL/rctl publish ns $NSMPS_NS
if [ $? -eq 0 ];then
    echo -e " namespace $NSMPS_NS published successfully"
else
    echo -e " failed to publish namespace $NSMPS_NS"  && exit -1
fi
sleep 10
#create nsmps workload
NSMPS_WORKLOAD=`cat ${NSMPS_YAML} | grep name| head -1|cut -d ":" -f2`
/opt/rafay/RCTL/rctl create workload ${NSMPS_YAML}
if [ $? -eq 0 ];then
    echo -e "workload $NSMPS_WORKLOAD created successfully"
else
    echo -e "failed to create workload $NSMPS_WORKLOAD"  && exit -1
fi
sleep 10
#publish nsmps workload
/opt/rafay/RCTL/rctl publish workload $NSMPS_WORKLOAD
if [ $? -eq 0 ];then
    echo -e "workload $NSMPS_WORKLOAD published successfully"
else
    echo -e "failed to publish workload $NSMPS_WORKLOAD"  && exit -1
fi