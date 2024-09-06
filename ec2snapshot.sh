#!/bin/bash

ssh -o StrictHostKeyChecking=no -i /data/MyKeyPair.pem ec2-user@13.229.83.51 "source ~/.bash_profile; /home/ec2-user/.local/bin/pcluster update-compute-fleet --status STOP_REQUESTED -n testcluster4; ~/update_snapshot.sh testdata 2 testcluster4"

