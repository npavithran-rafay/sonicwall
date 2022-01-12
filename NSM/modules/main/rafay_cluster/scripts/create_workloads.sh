CLUSTER_NAME_YAML=`cat ./ingress-controller-workload.yaml | grep clusters| head -1|cut -d ":" -f2`
sed -i '' -e "s/${CLUSTER_NAME_YAML}/ ${CLUSTER_NAME}/g" ./ingress-controller-workload.yaml
INGRESS_CTRL_WORKLOAD=`cat ./ingress-controller-workload.yaml | grep name| head -1|cut -d ":" -f2`
./rctl create workload ./ingress-controller-workload.yaml
if [ $? -eq 0 ];then
    echo -e workload $INGRESS_CTRL_WORKLOAD created successfully
else
    echo -e failed to create workload $INGRESS_CTRL_WORKLOAD
fi
