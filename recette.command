#!/bin/bash
echo "••••••••• Script de mise en recette…"

echo "••••••••• Récupérer la dernière version du code:"
cd vitonjob-v2
pwd
git pull origin master
ionic build

echo "••••••••• Se déplacer vers le répertoire de la recette:"
cd ../jobyer.github.io
pwd

echo "••••••••• Preparer le répertoire local de la recette:"
git pull origin master

echo"•••••••••• Copier le dossier build de la nouvelle version :"
sudo cp -R ../vitonjob-v2/www/build/ build/

echo "••••••••• Copier le dossier assets/i18n de la nouvelle version :"
sudo cp -R ../vitonjob-v2/www/assets/i18n/ assets/i18n/

echo "••••••••• Mettre à jour l'entête avec la version Vit-On-Job • $version"
version=$(date +'%d%m%Y-%H%M')
sed -i -e 's/\(<title>\).*\(<\/title>\)/<title>Vit-On-Job • '$version'<\/title>/g' index.html
rm index.html-e

echo "••••••••• Mettre à jour la recette sur github"
git add .
git commit -m 'Vit-On-Job • '$version
git push origin master

echo "••••••••• Mise en recette bien passée!"
