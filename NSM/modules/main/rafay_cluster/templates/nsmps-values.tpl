# Default values for gms.
# This is a YAML-formatted file.
# Declare variables to be passed into your templates.
image:
  registry: 823355659777.dkr.ecr.us-west-2.amazonaws.com
  repoPrefix: cscma-releases
  tag: 2.3.2-R8-f3d66c22
  pullPolicy: Always

deployment:
  stage: simulation
  onPrem: false
  enableManagement: true
  enableAnalytics: false
  enableDevLog: true
  standby: false
  golangGCTrace: false
  CSCMAHostName: rafay-nsmps-uswest.sonicwall.com
  awsRegion: ${region}
  ztServerHostPort: 10.97.130.121:21025

key:
  gmsAdminPasswordHash: d41e98XXXXXXXXXXXXd1eb92f0
  gmsAdminSharedKey: 50dcb4cb27c0XXXXXXXXXXXXXX40b45e78316969a34
  ztAdminSharedKey: 27w24fby45e7t8XXXXXXXXXXXXXXXX31300696923086969a96
  mtAdminSharedKey: 34e8cb4cb27w0XXXXXXXXXXXXXXX4f309396a43
  gmsTokenSecretKey: 4371c7eb246f27XXXXXXXXXXXXXXX42680a5f7520221
  nsmAdminMaxUserSessionCount: 50
  tokenIdleTimeoutMinutes: 15

# MSW settings
msw:
  cscFQDN: rafay-cloudbeta.sonicwall.com
  host: rafay-beta.mysonicwall.com
  apiHost: rafay-apibeta.mysonicwall.com
  wsdlHost: rafay-wsdl.beta.mysonicwall.com
  lmHost: 173.240.212.204
  apiKey: rafay-82A-11FF-44D1-8FB9-90DF925
  skipVerifyCert: false

smtp:
  sender: rafay-nsmalerts@nsmps-uswest.sonicwall.com

syslog:
  secureHost: rafay-nsmps-uswest-syslog.sonicwall.com
  securePort: 514

# GMS Ingress/Nginx Certificate, base64
gmsIngress:
  crt: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUd0akNDQlo2Z0F3SUJBZ0lKQU9zVE84V1VDQ1V0TUEwR0NTcUdTSWIzRFFFQkN3VUFNSUcwTVFzd0NRWURWUVFHRXdKVlV6RVFNQTRHQTFVRUNCTUhRWEpwZW05dVlURVRNQkVHQTFVRUJ4TUtVMk52ZEhSelpHRnNaVEVhTUJnR0ExVUVDaE1SUjI5RVlXUmtlUzVqYjIwc0lFbHVZeTR4TFRBckJnTlZCQXNUSkdoMGRIQTZMeTlqWlhKMGN5NW5iMlJoWkdSNUxtTnZiUzl5WlhCdmMybDBiM0o1THpFek1ERUdBMVVFQXhNcVIyOGdSR0ZrWkhrZ1UyVmpkWEpsSUVObGNuUnBabWxqWVhSbElFRjFkR2h2Y21sMGVTQXRJRWN5TUI0WERUSXdNREl5TURBeE5UUXhNMW9YRFRJeU1ESXlNREF4TlRReE0xb3dQVEVoTUI4R0ExVUVDeE1ZUkc5dFlXbHVJRU52Ym5SeWIyd2dWbUZzYVdSaGRHVmtNUmd3RmdZRFZRUUREQThxTG5OdmJtbGpkMkZzYkM1amIyMHdnZ0VpTUEwR0NTcUdTSWIzRFFFQkFRVUFBNElCRHdBd2dnRUtBb0lCQVFDMWpsMlR2M0lLeFhqU2w4ZVd5Q29xcUhPUmdDRDZ0VW1XZzN0dEFoeGZCQVBNcXV1V240VzVqM012ZGI5cSt0R2FqSXpzTWFTTXUveWVZMDdXVXB6NWFxMWl0eW9hQk9mQm5oYUtVRmNKV1RiU3NHMVBXd3ZEQ1k0Rjhnai9CdDhXcW81dWhOTDlGM2JYQTQ0Tjl0VkI5akdieGt4VHY4cVovM05UakYxRFpidnIrcG51RXo0eFAwYk9BRVdGTW4rSTIyZVd2bW1LRXhKTENlc3ZmSU02Z2VrMDk2a29RUHJJVlFIaEFIMURXT3NLQWNPM2R6N0hrQnQyRkxINE5uV0djcCtyejJDNnRodXo1bFNQSTBwRWtLazU0Rm1HeG9Nd2s4S3ZoOUNoY2kxMWJzYTF6Y3BlSjFZbTN0UmNldklycGxCWExxSGpqK3ZlaVp1eFo5LzdBZ01CQUFHamdnTS9NSUlET3pBTUJnTlZIUk1CQWY4RUFqQUFNQjBHQTFVZEpRUVdNQlFHQ0NzR0FRVUZCd01CQmdnckJnRUZCUWNEQWpBT0JnTlZIUThCQWY4RUJBTUNCYUF3T0FZRFZSMGZCREV3THpBdG9DdWdLWVluYUhSMGNEb3ZMMk55YkM1bmIyUmhaR1I1TG1OdmJTOW5aR2xuTW5NeExURTNNelV1WTNKc01GMEdBMVVkSUFSV01GUXdTQVlMWUlaSUFZYjliUUVIRndFd09UQTNCZ2dyQmdFRkJRY0NBUllyYUhSMGNEb3ZMMk5sY25ScFptbGpZWFJsY3k1bmIyUmhaR1I1TG1OdmJTOXlaWEJ2YzJsMGIzSjVMekFJQmdabmdRd0JBZ0V3ZGdZSUt3WUJCUVVIQVFFRWFqQm9NQ1FHQ0NzR0FRVUZCekFCaGhob2RIUndPaTh2YjJOemNDNW5iMlJoWkdSNUxtTnZiUzh3UUFZSUt3WUJCUVVITUFLR05HaDBkSEE2THk5alpYSjBhV1pwWTJGMFpYTXVaMjlrWVdSa2VTNWpiMjB2Y21Wd2IzTnBkRzl5ZVM5blpHbG5NaTVqY25Rd0h3WURWUjBqQkJnd0ZvQVVRTUs5SjQ3TU5JTXdvalBYKzJ5ejhMUXNnTTR3S1FZRFZSMFJCQ0l3SUlJUEtpNXpiMjVwWTNkaGJHd3VZMjl0Z2cxemIyNXBZM2RoYkd3dVkyOXRNQjBHQTFVZERnUVdCQlFyaU9KeHlxVGVIckdVcVBEc0tDSDN1bHlUUkRDQ0FYNEdDaXNHQVFRQjFua0NCQUlFZ2dGdUJJSUJhZ0ZvQUhVQXBMa0prTFFZV0JTSHV4T2l6R2R3Q2p3MW1BVDVHOSs0NDNmTkRzZ04zQkFBQUFGd1lFMTVFUUFBQkFNQVJqQkVBaUJWUENPNURtTFJzWmRqaEh1RUE4VitTZEdJdkRtVEFtYVc0QUw0aUlXK3N3SWdEelU5T2M2ZUdlemhwVExxQ2ZOYjU4QmtIaWZrdWEvdGF0ZWdmdWNuZkNBQWR3RHVTNzIzZGM1Z3V1RkNhUityNFo1bW93OStYN0J5MklNQXhIdUplcWo5eXdBQUFYQmdUWHBwQUFBRUF3QklNRVlDSVFDSUUyOVYzQWZmdVlKejR2eXo2K29IK1FHM0pySFFDUCtCQXhkRDNWZXl4UUloQUlaRkVUYnVXbFRWdFVybSsrMnhJMWlzT1dqMmhmVk50UFV3NHlPYTZ0bGxBSFlBVmhRR21pL1h3dXpUOWVHOVJMSSt4MFoydWJ5WkVWekE3NVNZVmRhSjBOMEFBQUZ3WUUxOExRQUFCQU1BUnpCRkFpRUFoS2dIdDFpdlBleVVhdUpuV3VuciszMlgyMEgwdzRFczJhaU9uRjRhRDVZQ0lFVkkzQUdwK0JCQllGWjdzUVdPRzBlZnNvalVJbHZlZ1U2MWF0TDlkNUtOTUEwR0NTcUdTSWIzRFFFQkN3VUFBNElCQVFBUGtVMEIrbG9Sa085dE03T2ZyU0dXU1RDdytOeGtTYVdqUHNscVZpN2p6Q3YxZ2o0cGljQ2s2R0xLbXN2MG5ENmxoSHI1SFM4YjlMTDJCTHRGRDcrbGcwZ3NqWkdxM1Z0VE5KT0FuSjBOR01sSkRoY1pRT0NvNENkcVRlMU1WWDR2MWE0UUo4eVdFSTBXUXd6RFUrVVN3bTBZL29XTlEzUmR5SFlNU0ppbGRvL3VsR0VrYmpOOVVqcVpFN3o3a0x3ek5DeThZK3IvSkVKZURqYkFINjBjd3l5OW5KZHR3dUhERmV5MFFQMVZlcEw2VTU1L045MUxTcE5rUlJqUHhFOVBXajAxVEFsUHRZbEFwTXlDOHNtV0s3SjBEN0xiYUFFc0VFQ25vVm1rUFY4eE1ieGRtRkJ3dVpFb2hNSExOWkhpZWd1NUxMOU9SRXJaUE5BTGNzUHAKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQ==
  key: XXXXXXXXXXXXXXXXXXXXXXXXXXXX

podAntiAffinity:
  enabled: true
  matchKey: kubernetes.io/os
  matchValue: linux
  topologyKey: failure-domain.beta.kubernetes.io/zone

# node affinity
nodeAffinity:
  giteaNodeSelector:
    eks.amazonaws.com/nodegroup: rafay-fra-eks-production-nsm-worker-nodegroup-gitea-new
  msNodeSelector:
    eks.amazonaws.com/nodegroup: rafay-fra-eks-production-general-woker-node-group

# HPA settings
hpa:
  enabled: true

# ElasticSearch settings
elasticsearch:
  #endpoint: https://vpc-na2aws-cscma-elasticseXXX.us-west-2.es.amazonaws.com
  endpoint: ${NSM_ES_Endpoint}
  auth: false
  daemonset:
    enabled: false
    endpoint: 

# Heartbeat ElasticSearch settings
hbES:
  #endpoint: https://vpc-na2aws-cscma-elastiXXX.us-west-2.es.amazonaws.com
  endpoint: ${NSM_ES_Endpoint}
  auth: false

# MongoDB settings
mongodb:
  cloud: true
  host: cluster0-xxx.mongodb.net
  user: xxx
  password: XXX

# MariaDB settings
mariadb:
  cloud: true
  #host: prodsim-cscma-db.c4hojxxxxxxb7.us-west-2.rds.amazonaws.com
  host: ${NSM_db_endpoint}
  port: 3306
  rootUser: gitea
  rootPassword:  xxx
  giteaPassword: xxx

# Redis settings
redis:
  cloud: true
  #host: na2aws-cscma-redis.p5xxxxxxx.usw2.cache.amazonaws.com:6379
  host: ${NSM_elasticache_primary_endpoint_address}

# Reporting Lite DB settings
reportLiteDB:
  enabled: true
  #host: nsm-prodsim-redshift-west-2.redshift.amazonaws.com
  host: ${NSM_redshift_endpoint}
  port: 5439
  database: report
  user: XXXXXXXXXXXXX
  password: XXXXXXXXXXXXX
  firehosePrefix: gms
  #s3Bucket: nsm-report-lite-beta.s3-us-west-2.amazonaws.com
  s3Bucket: ${NSM_S3Bucket_reportlite}
  accessKey: AKIXXXXX7R7
  secretKey: /Om86jXXXXXXNrWfH2J

# Analyzer
analyzer:
  enabled: true
  #rsHost: redshift-cc8owXXX56.us-west-2.redshift.amazonaws.com
  rsHost: ${analyzerNG_rs_redshift_cluster_endpoint}
  rsPort: 5439
  rsDB: E4EC2AXXXXXX847
  rsClusterName: redshift-analyzerng-cluster
  athenaTableName: flowdata
  athenaURLTableName: flowurl
  realtimeDynoTable: ANGReXXXXXXXrMod
  athenaResultS3BucketName: na2aws-XXXXXX-output
  dbUser: B96491E07XXXXXXXXXXXXXXX4FDC2E
  dbPassword: B96491E07F79F2XXXXXXXXXXXXXXX863C8089321B9287
  redisCache: true
  betaSNList: "18B1690676E0,18B169EF1300"
  athenaBlockedTableName: flowblocked
  athenaThreatTableName: flowthreat
  athenaDBName: "prodsimnsmflowlogs"
  athenaQueryDaysThresh: 366
  isSubSerial: true
  s3BucketName: na2aws-ps-analyzerng-static-bucket
  rsAdmin: B96491E07F79FXXXXXXXXXXXXXXXXXXXXXXXXXXXXE544FDC2E
  rsAdminPassword: B96491E07F7XXXXXXXXXXXXXXXXXXXXXXX9321B9287
  lambdaFuncName: query-redshift-forwarder-func
  dynamoDBTablePrefix: ANGRealTimeMonitorMod_
  useReportBucket: true
  useFlowTableOnly: true
  rtmRange: 10
  doFormulateCountryId: true
  athenaReportBucketTableName: reportdata
  enableBucketSchRep: false
  enableBucketCTA: false
  debugMode: true
  uniformDatapoints: true
  athenaDataS3BucketName: na2aws-XXXX-log-bucket
  logDownloadFinalBucket: na2aws-XXX-jar-bucket

# GraphDB
graphDB:
  enableNeptune: true
  neptuneWriterEndPoint: rafay-na2-neptune-XXX.cluster-c4hojpxb7tb7.us-west-2.neptune.amazonaws.com
  neptuneReaderEndPoint: rafay-na2-neptune-XXX.cluster-ro-c4hojpxb7tb7.us-west-2.neptune.amazonaws.com

datadog:
  enabled: true
  profilerEnabled: false # cpu/memory profile
  env: Prodsim # dev/qa/prodsim/prod

# RAB-NG Settings
rab:
  isngcollector: true
  ngcollectorip: 10.97.131.36 # CNG EKS Internal LB IP that is LAN Subnet of GFW
  redshiftdb:
    #url: jdbc:redshift-analyzerng-cluster.cc8owwd3ac56.us-west-2.redshift.amazonaws.com
    url: jdbc:${analyzerNG_rs_redshift_cluster_endpoint}
    user: XXXXXXXXXXXXXXX
    password: XXXXXXXXXXXXXXXXXXXXXXXX
    database: analyzerng
  awscredentials:
    awsaccesskeyid: AKIAXXXXXXXXXXXXXXXXXXKNCHGS
    awssecretkeyid: I6iopSozfXXXXXXXXXXXXXXXXXXXXXXgRjZ
    awsregion: ${region}
    awsendpoint: https://dynamodb.${region}.amazonaws.com

# Gitea backup settings
gitea:
  backup: true
  schedule: "0 0 23 * * *"
  s3Bucket: "nsm-cscma-prodsim/gitea-backup"
  diskSize: 42G
  cacheDiskSize: 42G


reportScheduler:
  ctaServerHost: rafay-ctav2.global.sonicwall.com
  ctaServerPort: 443
  s3BucketName: cscmaps-sch-rpt-bucket
  reportConfigMaxHeap: 2G
  reportSchedulerMaxHeap: 1G


# settings of fluentd subchart, only need to customize image info for different deployment
fluentd:
  image:
    repository: 823355659777.dkr.ecr.us-west-2.amazonaws.com/cscma-releases/gms-fluentd
    tag: 2.3.2-R8-f3d66c22

  replicaCount: 3

  output:
    #host: vpc-na2aws-cscma-elasticsearch-krbxcme7csg4rpjg4o6sq2gbxi.us-west-2.es.amazonaws.com
    host: ${NSM_ES_Endpoint}
    port: 443
    scheme: https