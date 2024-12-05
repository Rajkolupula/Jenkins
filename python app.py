import json
import boto3
def lambda_handler(event, context):
   client = boto3.client('ec2')
   response = client.run_instances(
      ImageId = 'ami-0614680123427b75e',
      InstanceType = 't2.micro' ,
      SubnetId = 'subnet-03b0f0d733b1cf64e',  
      KeyName = 'mumbai-key',
      MaxCount=1,
      MinCount=1
)
