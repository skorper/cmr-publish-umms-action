#!/bin/sh -l

venue=$1
version=$2
file=$3
provider=$4


echo "venue $venue"
echo "version $version"
echo "file $file"
echo "provider $provider"
echo "cmr_user $cmr_user"
echo "cmr_pass $cmr_pass"
time=$(date)
echo "::set-output name=time::$time"

# umms_updater -d -f cmr/${file} -a cmr/${venue}_associations.txt -p ${provider} -e ${venue} -cu "$cmr_user" -cp "$cmr_pass"