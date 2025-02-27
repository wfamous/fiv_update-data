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
ENV="$ENV"
GCP_PROJECT_ID="$GCP_PROJECT_ID"
GCP_SA_NAME="$GCP_SA_NAME"
GCP_SA_HOST="$GCP_SA_HOST"
GCP_SA_EMAIL="$GCP_SA_NAME@$GCP_PROJECT_ID.$GCP_SA_HOST"
GCP_BUCKET_NAME="$GCP_BUCKET_NAME"
GCP_LOCATION="$GCP_LOCATION"
GCP_SA_STORAGE_ROLE="$GCP_SA_STORAGE_ROLE"

# create service account
create_service_account "$GCP_PROJECT_ID" "$GCP_SA_NAME" "$GCP_SA_EMAIL"

# add IAM policy
bind_iam_policy "$GCP_PROJECT_ID" "$GCP_SA_EMAIL" "$GCP_SA_STORAGE_ROLE"

# create buckets
create_private_buckets "$GCP_BUCKET_NAME" "$GCP_LOCATION" "STANDARD" "$ENV"
