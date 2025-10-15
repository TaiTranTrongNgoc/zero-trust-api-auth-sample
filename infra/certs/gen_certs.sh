#!/bin/bash
set -e
mkdir -p infra/certs
cd infra/certs
openssl req -x509 -newkey rsa:2048 -days 365 -nodes -keyout ca.key -out ca.crt -subj "/CN=MyRootCA"
openssl req -newkey rsa:2048 -nodes -keyout server.key -out server.csr -subj "/CN=envoy"
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 365
openssl req -newkey rsa:2048 -nodes -keyout client.key -out client.csr -subj "/CN=testclient"
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 365
echo "✅ Certificates generated in infra/certs/"
