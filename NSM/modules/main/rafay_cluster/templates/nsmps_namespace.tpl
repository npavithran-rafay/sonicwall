kind: ManagedNamespace
apiVersion: config.rafay.dev/v2
metadata:
  name: ${namespace}
spec:
  type: RafayWizard
  placement:
    placementType: ClusterSpecific
    clusterLabels:
    - key: rafay.dev/clusterName
      value: ${cluster_name}