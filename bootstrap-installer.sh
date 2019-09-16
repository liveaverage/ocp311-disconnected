#!/bin/bash

export DIR_RPM=/var/www/html

subscription-manager repos --disable="*"
subscription-manager repos --enable="rhel-7-server-rpms" \
  --enable="rhel-7-server-extras-rpms" \
  --enable="rhel-7-server-ose-3.11-rpms" \
  --enable="rhel-7-server-ansible-2.6-rpms"

sudo yum -y install yum-utils createrepo docker docker-distribution git screen

### Add second disk if not present (for RPMs and/or docker images)
### ~17GB required for docker images, 10-20GB required for RPMs

mkdir -p ${DIR_RPM}

for repo in \
rhel-7-server-rpms \
rhel-7-server-extras-rpms \
rhel-7-server-ansible-2.6-rpms \
rhel-7-server-ose-3.11-rpms
do
  reposync --gpgcheck -lm --repoid=${repo} --download_path=${DIR_RPM} 
  createrepo -v ${DIR_RPM}${repo} -o ${DIR_RPM}${repo} 
done

### Follow this first for auth config: https://access.redhat.com/articles/3399531

 docker pull registry.redhat.io/openshift3/apb-base:v3.11.141
 docker pull registry.redhat.io/openshift3/apb-tools:v3.11.141
 docker pull registry.redhat.io/openshift3/automation-broker-apb:v3.11.141
 docker pull registry.redhat.io/openshift3/csi-attacher:v3.11.141
 docker pull registry.redhat.io/openshift3/csi-driver-registrar:v3.11.141
 docker pull registry.redhat.io/openshift3/csi-livenessprobe:v3.11.141
 docker pull registry.redhat.io/openshift3/csi-provisioner:v3.11.141
 docker pull registry.redhat.io/openshift3/grafana:v3.11.141
 docker pull registry.redhat.io/openshift3/local-storage-provisioner:v3.11.141
 docker pull registry.redhat.io/openshift3/manila-provisioner:v3.11.141
 docker pull registry.redhat.io/openshift3/mariadb-apb:v3.11.141
 docker pull registry.redhat.io/openshift3/mediawiki:v3.11.141
 docker pull registry.redhat.io/openshift3/mediawiki-apb:v3.11.141
 docker pull registry.redhat.io/openshift3/mysql-apb:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-ansible-service-broker:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-cli:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-cluster-autoscaler:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-cluster-capacity:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-cluster-monitoring-operator:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-console:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-configmap-reloader:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-control-plane:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-deployer:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-descheduler:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-docker-builder:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-docker-registry:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-efs-provisioner:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-egress-dns-proxy:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-egress-http-proxy:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-egress-router:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-haproxy-router:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-hyperkube:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-hypershift:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-keepalived-ipfailover:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-kube-rbac-proxy:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-kube-state-metrics:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-metrics-server:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-node:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-node-problem-detector:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-operator-lifecycle-manager:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-ovn-kubernetes:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-pod:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-prometheus-config-reloader:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-prometheus-operator:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-recycler:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-service-catalog:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-template-service-broker:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-tests:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-web-console:v3.11.141
 docker pull registry.redhat.io/openshift3/postgresql-apb:v3.11.141
 docker pull registry.redhat.io/openshift3/registry-console:v3.11.141
 docker pull registry.redhat.io/openshift3/snapshot-controller:v3.11.141
 docker pull registry.redhat.io/openshift3/snapshot-provisioner:v3.11.141
 docker pull registry.redhat.io/rhel7/etcd:3.2.22
 docker pull registry.redhat.io/openshift3/ose-efs-provisioner:v3.11.141



 docker pull registry.redhat.io/openshift3/metrics-cassandra:v3.11.141
 docker pull registry.redhat.io/openshift3/metrics-hawkular-metrics:v3.11.141
 docker pull registry.redhat.io/openshift3/metrics-hawkular-openshift-agent:v3.11.141
 docker pull registry.redhat.io/openshift3/metrics-heapster:v3.11.141
 docker pull registry.redhat.io/openshift3/metrics-schema-installer:v3.11.141
 docker pull registry.redhat.io/openshift3/oauth-proxy:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-logging-curator5:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-logging-elasticsearch5:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-logging-eventrouter:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-logging-fluentd:v3.11.141
 docker pull registry.redhat.io/openshift3/ose-logging-kibana5:v3.11.141
 docker pull registry.redhat.io/openshift3/prometheus:v3.11.141
 docker pull registry.redhat.io/openshift3/prometheus-alertmanager:v3.11.141
 docker pull registry.redhat.io/openshift3/prometheus-node-exporter:v3.11.141
