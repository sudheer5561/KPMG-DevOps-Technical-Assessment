#!/bin/bash

#provide the input value
metadata_item=$1


curl_package=`which curl | wc -l`
jq_package=`which jq | wc -l`

if [[ ${curl_package} -eq 0 || ${jq_package} -eq 0 ]]; then
   echo -e "required package is not installed, installing.."
   sudo apt-get -yq install curl jq
else
   echo -e "**Required packages 'curl' 'jq' are installed for executing this script**."
   echo
fi

echo "----------------------------------------------------------------------------"


#Get metadata of AWS instance:
echo -e "AWS instance metadata info is"
curl --silent -k http://169.254.169.254/latest/dynamic/instance-identity/document
echo
echo

echo "-------------------------------------------------------------------------------"

#Search for specific metadata item
if [[ $# -lt 1 ]]; then
echo -e "if you need particular data key to be retrieved individually please pass the metadata_item, *** USAGE: ./`basename $0` metadata_item ***"
else
echo -e "Searching for ${metadata_item}"
command_output=`curl --silent -k http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r ."${metadata_item}"`
echo
echo -e "value is = ${command_output}"
fi
