#!/bin/bash

echo "Username:"
read username

echo "Password:"
read -s password


nohup mount -t cifs //132.230.165.144/Archive /home/samuelwald/merscope_s3_bucket/mnt/pharma2-44 -o username=$username,password=$password,vers=3.0 &
