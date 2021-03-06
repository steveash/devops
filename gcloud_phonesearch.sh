#!/usr/bin/env bash

INST=phosrch-big-1
#PREEMPT=
PREEMPT='--maintenance-policy TERMINATE --preemptible'

gcloud compute --project "stevemash-syngen" disks create "$INST" --size "50" --zone "us-central1-b" --source-snapshot "java-snap-1" --type "pd-standard"

gcloud compute --project "stevemash-syngen" instances create "$INST" --zone "us-central1-b" --machine-type "n1-highcpu-32" $PREEMPT --network "default" --no-restart-on-failure --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write" --disk "name=$INST","device-name=$INST","mode=rw","boot=yes","auto-delete=yes"

echo "sleeping before running jg2p ..."
sleep 20

gcloud compute --project "stevemash-syngen" ssh --zone "us-central1-b" "$INST" --ssh-flag="-t" --command "curl -L https://raw.github.com/steveash/devops/master/setup_phonesearch.sh | sh"

cowsay 'all done'

gcloud compute --project "stevemash-syngen" ssh --zone "us-central1-b" "$INST" --ssh-flag="-t"

