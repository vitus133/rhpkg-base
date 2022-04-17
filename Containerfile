FROM registry.access.redhat.com/ubi8/ubi:latest

ADD http://download.devel.redhat.com/rel-eng/RCMTOOLS/rcm-tools-rhel-8-baseos.repo /etc/yum.repos.d/

RUN echo "sslverify=false" >> /etc/yum.conf && \
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
  yum install -y \
  @python36 \
  git \
  jq \
  wget \
  vim \
  python3-{devel,cryptography} \
  rhpkg ansible
RUN yum -y distro-sync && yum autoremove && yum clean all
