#!/bin/bash

chemin_git="/var/jenkins_home/templates/"

cd "$chemin_git/"
echo "Template Pipeline" >> README.md

# Étape 1 : Ajouter le fichier .gitignore
if [ -f .gitignore ]; then
    echo ".gitignore existe."
else
    echo "Ajout du répertoire .terraform/ au fichier .gitignore"
    echo ".terraform/ \n .terraform.lock.hcl" >> .gitignore
fi

# Étape 2 : Git add, commit et push
echo "Git add, commit et push"
git init
git add .
git commit -m "first commit"
git branch -M master
if ! git remote | grep -q "origin"; then
    echo "Configuration du dépôt distant"
    git remote add origin https://"${TOKEN}"@"${URL_HTTPS_GIT}"
fi

git push -u origin master
