#!/bin/bash

# Set the Kibana URL
KIBANA_URL="http://localhost:5601"

# Get the Kibana status
KIBANA_STATUS=$(curl -s -o /dev/null -w '%{http_code}' ${KIBANA_URL})

# If the Kibana status is 200, print "Kibana is running"
if [ ${KIBANA_STATUS} -eq 200 ]; then
  echo "Kibana is running"
else
  echo "Kibana is not running"
fi
