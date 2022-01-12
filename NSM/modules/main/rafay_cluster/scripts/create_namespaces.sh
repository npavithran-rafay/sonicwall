INGRESS_CTRL_NS=`cat ./ingress-nginx-ns.yaml | grep name|cut -d ':' -f2`
./rctl create ns -f ./ingress-nginx-ns.yaml
if [ $? -eq 0 ];then
    echo -e namespace $INGRESS_CTRL_NS created successfully
else
    echo -e failed to create namespace $INGRESS_CTRL_NS && exit 0
fi
