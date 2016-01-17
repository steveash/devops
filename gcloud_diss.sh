#!/usr/bin/env bash

INST=diss-vm-1
export CLOUDSDK_COMPUTE_ZONE=us-central1-c
ZONE=us-central1-c

gcloud compute --project "stevemash-syngen" instances create "$INST" --machine-type "n1-highcpu-32" \
--network "default" --no-restart-on-failure --maintenance-policy "TERMINATE" --preemptible \
--scopes "https://www.googleapis.com/auth/cloud.useraccounts.readonly","https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write" \
--disk "name=diss-1","device-name=diss-1","mode=rw","boot=yes"

echo "sleeping to let the vm startup fully ..."
sleep 20

# gcloud compute --project "stevemash-syngen" ssh --zone "us-central1-b" "$INST" --ssh-flag="-t" --command "curl -L https://raw.github.com/steveash/devops/master/setup_jg2p.sh | sh"

cowsay 'all done'

gcloud compute --project "stevemash-syngen" ssh "$INST" --ssh-flag="-t"

