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
# gcp
export GCP_PROJECT_ID="$TF_VAR_gcp_project_id"
export GCP_SA_NAME="$TF_VAR_gcp_sa_name"
export GCP_SA_HOST="$TF_VAR_gcp_sa_host"
export GCP_SA_EMAIL="$GCP_SA_NAME@$GCP_PROJECT_ID.$GCP_SA_HOST"
export GCP_BUCKET_NAME="$TF_VAR_gcp_backend_bucket_name"
export GCP_REGION="$TF_VAR_gcp_region"
export GCP_SA_STORAGE_ROLE=(${TF_VAR_gcp_sa_storage_role[@]})
export GCP_SA_KEY_FILE="../external/sa-key.json"


# create service account
create_service_account "$GCP_PROJECT_ID" "$GCP_SA_NAME" "$GCP_SA_EMAIL" "$GCP_SA_HOST"

# add IAM policy
bind_sa_iam_policy "$GCP_PROJECT_ID" "$GCP_SA_EMAIL" "${GCP_SA_STORAGE_ROLE[@]}"

# create backend bucket for terraform
create_tf_backend_bucket "$GCP_BUCKET_NAME" "$GCP_REGION" "STANDARD" "$ENV"


