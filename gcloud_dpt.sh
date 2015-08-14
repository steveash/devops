#!/usr/bin/env bash

INST=dpt-big-1

gcloud compute --project "stevemash-syngen" disks create "$INST" --size "10" --zone "us-central1-b" --source-snapshot "java-snap-1" --type "pd-standard"

gcloud compute --project "stevemash-syngen" instances create "$INST" --zone "us-central1-b" --machine-type "n1-highcpu-32" --network "default" --no-restart-on-failure --maintenance-policy "TERMINATE" --preemptible --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write" --disk "name=$INST","device-name=$INST","mode=rw","boot=yes","auto-delete=yes"

echo "sleeping before running jg2p ..."
sleep 20

gcloud compute --project "stevemash-syngen" ssh --zone "us-central1-b" "$INST" --ssh-flag="-t" --command "curl -L https://raw.github.com/steveash/devops/master/setup_dpt.sh | sh"

# need to rsync the business to the cloud 
gcloud compute copy-files /home/steve/Downloads/dpt/data-profiling-tool-2.0.0-SNAPSHOT $INST:~/dpt --zone "us-central1-b"

cowsay 'all done'

gcloud compute --project "stevemash-syngen" ssh --zone "us-central1-b" "$INST" --ssh-flag="-t"

