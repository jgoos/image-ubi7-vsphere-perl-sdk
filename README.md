### vSphere perl SDK image

> **note** [Deprecation notice](https://kb.vmware.com/s/article/80144): The vSphere SDK for Perl is deprecated.
> Use this image to migrate away from this SDK.

#### Download

Download version 7.0U2 ([VMware-vSphere-Perl-SDK-7.0.0-17698549.x86_64.tar.gz](https://developer.vmware.com/web/sdk/7.0/vsphere-perl)).

#### Build

``` shell

podman build -t vsphere-perl-sdk .

```

#### Variables

| Name          | Info             |
|:------------- |:---------------- |
| HTTPS_CA_FILE | The CA file      |
| HTTPS_CA_DIR  | The CA directory |

#### Run

Steps:
- Download the CA certificate .zip from the vcenter
- Unzip the CA certifcate .zip
- Run the podman command

``` shell

# Example Usage

$ unzip ca-certs.zip
$ ls ca-certs/
my-ca.crt

podman run -it --rm -v ca-certs:/mnt/ -e "HTTPS_CA_DIR=/mnt" -e "HTTPS_CA_FILE=my-ca.crt" vsphere-perl-sdk /usr/lib/vmware-vcli/apps/general/connect.pl

```

#### Documentation

https://developer.vmware.com/docs/11800/vsphere-sdk-for-perl-installation-guide/
https://developer.vmware.com/web/sdk/7.0/vsphere-perl
