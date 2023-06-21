#!/bin/bash

# Set the Elasticsearch URL
ELASTICSEARCH_URL="http://localhost:9200"

# Get the Elasticsearch status
ELASTICSEARCH_STATUS=$(curl -s -o /dev/null -w '%{http_code}' ${ELASTICSEARCH_URL})

# If the Elasticsearch status is 200, print "Elasticsearch is running"
if [ ${ELASTICSEARCH_STATUS} -eq 200 ]; then
  echo "Elasticsearch is running"
else
  echo "Elasticsearch is not running"
fi

# Get the Elasticsearch cluster health
ELASTICSEARCH_HEALTH=$(curl -s -H 'Content-Type: application/json' -XGET ${ELASTICSEARCH_URL}/_cluster/health?pretty)

# Print the Elasticsearch cluster health
echo ${ELASTICSEARCH_HEALTH}
