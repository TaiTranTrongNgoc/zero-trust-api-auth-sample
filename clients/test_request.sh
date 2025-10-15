#!/bin/bash
TOKEN="REPLACE_WITH_YOUR_TOKEN"
curl -k https://localhost:8443/   --cert infra/certs/client.crt   --key infra/certs/client.key   -H "Authorization: Bearer $TOKEN"
