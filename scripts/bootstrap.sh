#!/usr/bin/bash
# ===================================
# Author: @wfamous / famousinvogue.com
# Initial boostrap (for local version)
# ===================================

# imports
set -a
source "../.env"
set +a
source "./gcp_utils.sh"

# ====
#  SET VARIABLES
# ====
export ENV="$ENV"
# aws
export AWS_ACCESS_KEY_ID="$TF_VAR_aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="$TF_VAR_aws_secret_access_key"
export AWS_DEFAULT_REGION="$TF_VAR_aws_default_region"
# gcp - common
export GCP_PROJECT_ID="$TF_VAR_gcp_project_id"
export GCP_SA_HOST="$TF_VAR_gcp_sa_host"
export GCP_REGION="$TF_VAR_gcp_region"
export GCP_SA_KEYS_FOLDER="../external"
# gcp - terraform
export GCP_TF_SA_NAME="$TF_VAR_gcp_sa_name"
export GCP_TF_SA_EMAIL="$GCP_TF_SA_NAME@$GCP_PROJECT_ID.$GCP_SA_HOST"
export GCP_TF_BUCKET_NAME="$TF_VAR_gcp_backend_bucket_name"
export GCP_TF_SA_STORAGE_ROLE=(${TF_VAR_gcp_sa_storage_role[@]})
export GCP_TF_SA_KEY_FILE="$GCP_TF_SA_KEY_FILE"
# gcp - storage manager
export GCP_SM_SA_NAME="$GCP_SM_SA_NAME"
export GCP_SM_SA_EMAIL="$GCP_SM_SA_NAME@$GCP_PROJECT_ID.$GCP_SA_HOST"
export GCP_SM_SA_STORAGE_ROLE=(${GCP_SM_SA_STORAGE_ROLE[@]})
export GCP_SM_SA_KEY_FILE="$GCP_SM_SA_KEY_FILE"



# create service accounts
create_service_account "$GCP_PROJECT_ID" "$GCP_TF_SA_NAME" "$GCP_TF_SA_EMAIL" \
"$GCP_SA_HOST" "$GCP_TF_SA_KEY_FILE" "$GCP_SA_KEYS_FOLDER" # terraform

create_service_account "$GCP_PROJECT_ID" "$GCP_SM_SA_NAME" "$GCP_SM_SA_EMAIL" \
"$GCP_SA_HOST" "$GCP_SM_SA_KEY_FILE" "$GCP_SA_KEYS_FOLDER"# storage manager

# add IAM policies
bind_sa_iam_policy "$GCP_PROJECT_ID" "$GCP_TF_SA_EMAIL" "${GCP_TF_SA_STORAGE_ROLE[@]}"
bind_sa_iam_policy "$GCP_PROJECT_ID" "$GCP_SM_SA_EMAIL" "${GCP_SM_SA_STORAGE_ROLE[@]}"

# create backend bucket for terraform
create_tf_backend_bucket "$GCP_TF_BUCKET_NAME" "$GCP_REGION" "STANDARD" "$ENV"


