#!/bin/bash

echo "Downloading secure bundle..."
curl -L $2 > creds.zip

echo "Start cqlsh..."
cqlsh --secure-connect-bundle=creds.zip -u $1
