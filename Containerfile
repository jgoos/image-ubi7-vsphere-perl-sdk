FROM registry.access.redhat.com/ubi7/ubi

MAINTAINER J Goossens "<jgoos.code@gmail.com>"

LABEL vsphere_perl_sdk_version=7.0U2

ENV PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/root/perl5"
ENV PERL_MB_OPT="--install_base /root/perl5"
ENV PERL_MM_OPT="INSTALL_BASE=/root/perl5"
ENV PERL5LIB="/usr/share/perl5/:/root/perl5/lib/perl5:$PERL5LIB"
ENV PATH="/root/perl5/bin:$PATH"

ADD VMware-vSphere-Perl-SDK-7.0.0-17698549.x86_64.tar.gz /tmp

RUN yum update \
    && yum install -y gcc gcc-c++ perl-CPAN e2fsprogs e2fsprogs-devel libuuid-devel openssl-devel perl-devel \
    glibc.i686 zlib.i686 perl-XML-LibXML libncurses.so.5 perl-Crypt-SSLeay \
    && yum group install -y "Development Tools" \
    && yum clean all \
    && /tmp/vmware-vsphere-cli-distrib/vmware-install.pl --default EULA_AGREED=yes \
    && rm -rf /tmp/vmware-vsphere-cli-distrib
