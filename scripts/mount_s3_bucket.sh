#!/bin/bash

nohup rclone mount radosgw: /home/samuelwald/merscope_s3_bucket/mnt/s3_bucket/ --daemon
