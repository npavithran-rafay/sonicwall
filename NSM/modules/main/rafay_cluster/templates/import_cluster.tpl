kind: Cluster
metadata:
  # set the name of the cluster
  name: ${cluster_name} 
  # specific the project name to create the cluster
  project: ${project_name}
  # cluster labels
  #labels:
  #  env: dev
  #  type: ml-workloads
spec:
  # type can be "imported"
  type: imported
  # location, can be custom or predefined
  location: aws/${region}
  # blueprint below is optional, if not specified, default value is "default"
  blueprint: ${blueprint}
  # blueprintversion below is optional, if not specified, latest version in the blueprint will be used"
  #blueprintversion: ${blueprintversion}