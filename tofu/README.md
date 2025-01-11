# New to Terraform ?

## Install Open Tofu

Open Tofu is an open source copy of Terraform. To install it and use it to manage your infrastructures you can follow these steps:
https://opentofu.org/docs/intro/install/deb/

## Install AWS CLI

You will need to install the AWS CLI if you want Open Tofu to use your AWS credentials initiate your backend with it.
Follow these steps : 
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

## Manage secret variables

You need to create a .tfvars file at the root of your environments to manage your common variables (AWS, other providers etc).

You will have to export your AWS credentials variable in your terminal to run ```tofu init```  

```bash
export AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="AWS_SECRET_KEY"

# or 
export AWS_SESSION_TOKEN="AWS_SESSION_TOKEN" 
```

