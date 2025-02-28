#!/usr/bin/bash
# ===================================
# Author: @wfamous / famousinvogue.com
# Initial boostrap
# ===================================

# imports
set -a
source "../.env"
set +a
source "./gcp_utils.sh"

# set variables
export ENV="$ENV"
export GCP_PROJECT_ID="$TF_VAR_GCP_PROJECT_ID"
export GCP_SA_NAME="$TF_VAR_GCP_SA_NAME"
export GCP_SA_HOST="$TF_VAR_GCP_SA_HOST"
export GCP_SA_EMAIL="$GCP_SA_NAME@$GCP_PROJECT_ID.$GCP_SA_HOST"
export GCP_BUCKET_NAME="$TF_VAR_GCP_BACKEND_BUCKET_NAME"
export GCP_REGION="$TF_VAR_GCP_REGION"
export GCP_SA_STORAGE_ROLE="$TF_VAR_GCP_SA_STORAGE_ROLE"

# create service account
create_service_account "$GCP_PROJECT_ID" "$GCP_SA_NAME" "$GCP_SA_EMAIL"

# add IAM policy
bind_iam_policy "$GCP_PROJECT_ID" "$GCP_SA_EMAIL" "$GCP_SA_STORAGE_ROLE"

# create buckets
create_private_buckets "$GCP_BUCKET_NAME" "$GCP_REGION" "STANDARD" "$ENV"
