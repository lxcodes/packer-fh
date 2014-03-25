#!/bin/bash
export PATH="/bin/:/usr/sbin:/usr/bin:/sbin:${PATH}"
apt="apt-get -qq -y"

set -x

fail()
{
    echo "FATAL: $*"
    exit 1
}

OS="$(lsb_release -s -i | tr '[A-Z]' '[a-z]')"
if [ "$OS" = "centos" ] ; then
    OSRELEASE="$(lsb_release -s -r | sed -e 's/\..*//')"
    run_cmd=""
    rootfs=""
    cf_class="vagrant_centos_cfengine"
else
    OSRELEASE="$(lsb_release -s -c)"
fi
