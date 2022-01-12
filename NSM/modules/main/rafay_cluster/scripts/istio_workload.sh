
NAMESPACE_YAML="$1"
ISTIO_BASE_YAML="$2"
ISTIOD_YAML="$3"

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

#create istio-system namespace
ISTIO_NS=`cat ${NAMESPACE_YAML} | grep name|cut -d ':' -f2`
/opt/rafay/RCTL/rctl create ns -f ${NAMESPACE_YAML}
if [ $? -eq 0 ];then
    echo -e " namespace $ISTIO_NS created successfully"
else
    echo -e " failed to create namespace $ISTIO_NS"  && exit 0
fi
#publish namespace
/opt/rafay/RCTL/rctl publish ns $ISTIO_NS
if [ $? -eq 0 ];then
    echo -e " namespace $ISTIO_NS published successfully"
else
    echo -e " failed to publish namespace $ISTIO_NS"  && exit 0
fi
sleep 10
#create istio-base workload
ISTIO_BASE_WORKLOAD=`cat ${ISTIO_BASE_YAML} | grep name| head -1|cut -d ":" -f2`
/opt/rafay/RCTL/rctl create workload ${ISTIO_BASE_YAML}
if [ $? -eq 0 ];then
    echo -e "workload $ISTIO_BASE_WORKLOAD created successfully"
else
    echo -e "failed to create workload $ISTIO_BASE_WORKLOAD"  && exit 0
fi

sleep 10
#create istiod workload
ISTIOD_WORKLOAD=`cat ${ISTIOD_YAML} | grep name| head -1|cut -d ":" -f2`
/opt/rafay/RCTL/rctl create workload ${ISTIOD_YAML}
if [ $? -eq 0 ];then
    echo -e "workload $ISTIOD_WORKLOAD created successfully"
else
    echo -e "failed to create workload $ISTIOD_WORKLOAD"  && exit 0
fi
sleep 10
#publish istio-base workload
/opt/rafay/RCTL/rctl publish workload $ISTIO_BASE_WORKLOAD
if [ $? -eq 0 ];then
    echo -e "workload $ISTIO_BASE_WORKLOAD published successfully"
else
    echo -e "failed to publish workload $ISTIO_BASE_WORKLOAD"  && exit 0
fi
sleep 10
#publish istiod workload
/opt/rafay/RCTL/rctl publish workload $ISTIOD_WORKLOAD
if [ $? -eq 0 ];then
    echo -e "workload $ISTIOD_WORKLOAD published successfully"
else
    echo -e "failed to publish workload $ISTIOD_WORKLOAD"  && exit 0
fi