#!/bin/sh -l

env=$1
version=$2
file=$3
provider=$4


echo "env $env"
echo "version $version"
echo "file cmr/${file}"
echo "provider $provider"
echo "cmr_user $cmr_user"
echo "cmr_pass $cmr_pass"
echo "assoc cmr/${venue}_associations.txt"
time=$(date)
echo "::set-output name=time::$time"

# umms_updater -d -f cmr/${file} -a cmr/${env}_associations.txt -p ${provider} -e ${env} -cu "$cmr_user" -cp "$cmr_pass"