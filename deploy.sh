#!/bin/bash

# Load Environment variables from .env file
echo -------------- Loading Environment variables --------------
source .env && export $(cut -d= -f1 .env | grep -Fv '#'  | grep -v '^$')

# Build and upload Docker image to Google Docker Registry
echo -------------- Building Image --------------
gcloud builds submit --config=cloudbuild.yaml --substitutions=_SECRET_KEY=${DJANGO_SECRET_KEY},_ALLOWED_HOSTS=${DJANGO_ALLOWED_HOSTS}

# Deploy image in Google Run
echo -------------- Deploying Image --------------
gcloud run deploy login-page-api --image=gcr.io/totemic-sector-293316/login-page-api --platform=managed --region=europe-west2 --port=8000