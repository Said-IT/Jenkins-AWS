#!/bin/bash

terraform_directory="/var/jenkins_home/infra"

template_directory="/var/jenkins_home/templates/$TEMPLATE"
csv_file="/var/jenkins_home/templates/ACTUAL_INFRA.csv"

cp -r "$template_directory"  "$terraform_directory/${PROJECT_NAME}"

cd "$terraform_directory/${PROJECT_NAME}"

pwd

sed -i "s|INFRANAME|${PROJECT_NAME}|g" main.tf

sed -i "s/region = \"[a-zA-Z0-9_\-]*\"/region = \"${REGION_NAME}\"/g" main.tf

terraform init -no-color

terraform apply -auto-approve -no-color

if [ ! -f "$csv_file" ]; then
    # Si le fichier CSV n'existe pas, créer le fichier avec l'en-tête
    echo "PROJECT_NAME,TEMPLATE_USED" > "$csv_file"
fi

# Ajouter la ligne correspondant au déploiement actuel
echo "${PROJECT_NAME},${TEMPLATE}" >> "$csv_file
