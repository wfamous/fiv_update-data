#!/usr/bin/bash
# ===================================
# Author: @wfamous / famousinvogue.com
# Reusable functions
# ===================================

# check if service account already exist
function check_service_account() {
    local SA_ACCOUNT_EMAIL=$1

    gcloud iam service-accounts list --format="value(email)" | grep -w "$SA_ACCOUNT_EMAIL" &> /dev/null
    return $?
}

# create service account
function create_service_account() {
    local PROJECT_ID=$1
    local SA_NAME=$2
    local SA_ACCOUNT_EMAIL=$3

    SA_ACCOUNT_EMAIL="$SA_NAME@$PROJECT_ID.iam.gserviceaccount.com"

    if check_service_account "$SA_ACCOUNT_EMAIL"; then
        echo "Service account '$SA_ACCOUNT_EMAIL' already exists."
    else
        echo "Creating service account '$SA_ACCOUNT_EMAIL' ..."
        gcloud iam service-accounts create "$SA_NAME" --display-name "Terraform Service Account"
        echo "✅ Service account created successfully!"
    fi
}

# adds IAM policy to service account
function bind_iam_policy(){
  local PROJECT_ID=$1
  local SA_ACCOUNT_EMAIL=$2
  local IAM_ROLE=$3

  gcloud projects add-iam-policy-binding "$PROJECT_ID" \
  --member=serviceAccount:"$SA_ACCOUNT_EMAIL" \
  --role="$IAM_ROLE"
}

# creates buckets
function create_private_buckets(){
  local BUCKET_NAME=$1
  local BUCKET_LOCATION=$2
  local CLASS_STORAGE=$3

  gcloud storage buckets create gs://"$BUCKET_NAME" \
  --location="$BUCKET_LOCATION" --public-access-prevention \
  --uniform-bucket-level-access --default-storage-class="$CLASS_STORAGE"
}