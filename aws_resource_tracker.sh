#!/bin/bash
set -x
### list s3 buckets
echo "print list of s3 buckets"
aws s3 ls > aws_resource_tracker
## list EC2 instances
echo "print list of ec2 instance Ids"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> aws_resource_tracker
# list lambda functions
echo "print list of lambda functions"
aws lambda list-functions >> aws_resource_tracker
# IAM users
echo "print list of IAM users"
aws iam list-users >> aws_resource_tracker
