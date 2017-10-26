#!/bin/bash
echo "••••••••• Script de mise en recette…"

#Move to debug directory 
cd /Users/tim/Documents/vitonjob/jobyer.github.io

echo "••••••••• La version de la recette sera :"
version=$(date +'%d%m%Y-%H%M')

echo "••••••••• Mettre à jour l'entête avec la version Vit-On-Job • $version"
sed -i -e 's/\(<title>\).*\(<\/title>\)/<title>Vit-On-Job • '$version'<\/title>/g' index.html

echo"•••••••••• Copier le dossier build de la nouvelle version :"
cp -rf ../vitonjob-v2/www/build/* 



echo "••••••••• Tapez le mode de l’environnement du bundle (prod ou dev) :"
read y
echo "••••••••• Compresser le bundle de Jobyer…"$version


echo "••••••••• Enregistrement du fichier dans le répertoire: " 
echo "••••••••• /Users/tim/Documents/vitonjob/ios builds/Jobyer/jobyer_v"$x"_"$y".tar.bz2"
echo "••••••••• Votre fichier est bien généré!"