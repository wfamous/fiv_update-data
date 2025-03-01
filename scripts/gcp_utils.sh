#!/usr/bin/bash
# ===================================
# Author: @wfamous / famousinvogue.com
# Reusable functions for GCP
# ===================================

# check if service account already exist
function check_service_account() {
  echo "Step : Check is Service Account Exist"
  local SA_ACCOUNT_EMAIL=$1

  gcloud iam service-accounts list --format="value(email)" | grep -w "$SA_ACCOUNT_EMAIL" &> /dev/null
  return $?
}

# create service account
function create_service_account() {
  echo "Step : Create Service Account"
  local PROJECT_ID=$1
  local SA_NAME=$2
  local SA_ACCOUNT_EMAIL=$3
  local SA_ACCOUNT_HOST=$4

  SA_ACCOUNT_EMAIL="$SA_NAME@$PROJECT_ID.$SA_ACCOUNT_HOST"

  if check_service_account "$SA_ACCOUNT_EMAIL"; then
      echo "--Service account '$SA_ACCOUNT_EMAIL' already exists."
  else
      echo "--Creating service account '$SA_ACCOUNT_EMAIL' ..."
      gcloud iam service-accounts create "$SA_NAME" --display-name "Terraform Service Account"
      echo "✅ Service account created successfully!"
  fi
}

# adds IAM policy to service account
function bind_sa_iam_policy(){
  echo "Step : Bind IAM policy to Service Account"
  local PROJECT_ID=$1
  local SA_ACCOUNT_EMAIL=$2
  shift 2
  local IAM_ROLES=("$@")


   # assign multiple roles to service account
  for ROLE in "${IAM_ROLES[@]}"; do
    echo "ROle is : " "$ROLE"
    gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member=serviceAccount:"$SA_ACCOUNT_EMAIL" \
    --role="$ROLE"
  done
}

# creates buckets
function create_tf_backend_bucket(){
  echo "Step: Now ready to create private bucket"
  local BUCKET_NAME=$1
  local BUCKET_LOCATION=$2
  local CLASS_STORAGE=$3
  local ENV=$4

  # assign to array
  BUCKET_NAMES=($BUCKET_NAME)

  if check_bucket_name ${BUCKET_NAMES[@]} $ENV; then
    echo "--Backend bucket already exists."
  else
    echo "--Creating backend bucket exists."
    gcloud storage buckets create gs://"$BUCKET_NAME-$ENV" \
    --location="$BUCKET_LOCATION" --public-access-prevention \
    --uniform-bucket-level-access --default-storage-class="$CLASS_STORAGE"
  fi
}

# check bucket existence
function check_bucket_name(){
  echo "Step : Check if one of the bucket is already created"
  local BUCKET_NAMES=$1
  local ENV=$ENV

  for BUCKET in "${BUCKET_NAMES[@]}"; do
    echo "bucket is :" $BUCKET_NAMES
    if gcloud storage buckets list --format="value(name)" | grep -wq "$BUCKET-$ENV"; then
      echo "Bucket gs://$BUCKET-$ENV already exists."
    else
      return 1
    fi
  done
}