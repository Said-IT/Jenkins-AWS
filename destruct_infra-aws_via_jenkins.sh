#!/bin/bash

# Définir le chemin vers la configuration Terraform
chemin_terraform="/var/jenkins_home/infra/${NAME_INFRA}"

# Vérifier si le répertoire Terraform existe
if [ ! -d "$chemin_terraform" ]; then
  echo "Le répertoire '$chemin_terraform' n'existe pas."
  exit 1
fi

# Accéder au répertoire Terraform
cd "$chemin_terraform"

# Détruire les infrastructures déployées avec Terraform
terraform destroy -auto-approve

wait

cd ..
if [ -d "${NAME_INFRA}" ]; then
  rm -r "${NAME_INFRA}"
  echo "Le répertoire '${NAME_INFRA}' a été supprimé avec succès."
else
  echo "Le répertoire '${NAME_INFRA}' n'existe pas."
fi


echo "Les infrastructures ont été détruites avec succès."
