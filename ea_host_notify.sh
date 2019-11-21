#!/usr/bin/env bash

# Edit your Enterprise Alert REST API URL and use your own API Key
EA_URL=https://<enterprise alert server>/EAWebService/rest/events?apiKey=<api-key>

IFS='%'

EA_MSG="{ \"Title\": \"Host $1 notification\", \"Host\": \"$2\", \"IP\": \"$3\", \"State\": \"$4\", \"Additional Info\":\"$5\", \"Nagios notification\": \"$6\", \"X-S4-Service\": \"Nagios\" }"

#Send event to Enterprise Alert
curl -L -X POST -H "Content-type: application/json" --data "$EA_MSG" $EA_URL

unset IFS
