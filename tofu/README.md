# New to Terraform ?

## Install Open Tofu

Open Tofu is an open source copy of Terraform. To install it and use it to manage your infrastructures you can follow these steps:
https://opentofu.org/docs/intro/install/deb/

## Install AWS CLI

You will need to install the AWS CLI if you want Open Tofu to use your AWS credentials and initiate your backend with it.
Follow these steps : 
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

## Manage your secret variables

You need to create a .tfvars file at the root of your project or environment folder to manage your common environment variables (keys, folder names, paths etc).

To run the command ```tofu init```: 
You will have to configure your AWS CLI by either overwriting the configuration file 
 
 ``` sudo nano ~/.aws/credentials``` 
 
 or export your AWS credentials variables in your terminal  

```bash
export AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="AWS_SECRET_KEY"
export AWS_SESSION_TOKEN="AWS_SESSION_TOKEN" # alternative

# or  load your variables files
source .env.dev 
source .env.prod
```


## Usefule commands

Check which AWS credentials are used

```bash 
aws sts get-caller-identity
```

Check your exported variables

```bash 
aws sts get-caller-identity
```

Manage your infrastructure with tofu

```bash 
tofu init
tofu plan 
tofu apply
```

There is no need to created a prod folder if you use variables dynamically.
