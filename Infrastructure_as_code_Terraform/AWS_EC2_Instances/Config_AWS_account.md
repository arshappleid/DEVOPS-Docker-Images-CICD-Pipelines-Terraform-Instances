
For the following terraform scripts to run , you need to Configure AWS account on your localhost.
Then terraform when interacting with your AWS account , will automatically use that credential to provision resources.

### Steps to configure AWS account on local:
1. Generate IAM user , with admin privileges in AWS.
2. Make sure the user has all the required permission to create the required resources.
2. Store the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY for the IAM user as environment variables onto your machine.
    - For mac run ``` export AWS_ACCESS_KEY_ID="key_id_value" ; export AWS_SECRET_ACCESS_KEY="access_key_value" ; ```
    - For windows run ``` $env:AWS_ACCESS_KEY_ID="key_id_value" ; $env:AWS_SECRET_ACCESS_KEY="access_key_value" ; ```
    - Also can set ``` export AWS_DEFAULT_REGION="us-east-1"; ```
    
    
    
### How to run terraform Scripts
1. Go into the appropriate folder
2. run ``` terraform init ;```
3. run ``` terraform plan ;``` optional : will give you overview of what will happen
4. run ``` terrafrom apply; ``` After upadating a config file , run this again to apply the modified changes.