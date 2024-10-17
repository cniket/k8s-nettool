#!/bin/bash

get_api_group() {

    if [ -z "$resource" ]; then
        echo "Invalid input, empty string, exiting!"
        return 1
    fi
  resource_info=$(kubectl api-resources --no-headers | grep -iE '(^|[ ,])'$1'([ ,]|$)' | grep -iv metric)
  echo -e "The result is: \n$resource_info"

  if [ -z "$resource_info" ]; then
      echo "The resource '$1' not found in this cluster."
  else
      api_group=$(echo "$resource_info" | awk '{for(i=1;i<=NF;i++) if ($i ~ /\// || $i =="v1") print $i }' | cut -d'/' -f1)
      num_api_groups=$(echo "$api_group" | wc -w)
      if [ $num_api_groups -gt 1 ]; then
      echo "The resource '$1' is part of multiple apiGroups as following: $api_group" | tr '\n' ' '
      elif [ $api_group == "v1" ]; then
      echo "The resource '$1' is part of k8s core apiGroup."
      else
      echo "The apiGroup for resource '$1' is: $api_group"
      fi   
  fi
}

read -p "Enter the Kubernetes resource name: " resource

get_api_group $resource
