#!/bin/bash

# Définir le nom du dépôt et le répertoire de destination
REPO="pure-fish/pure"
DEST_DIR="docs/components/release-notes"

# Créer le répertoire de destination s'il n'existe pas
mkdir -p "$DEST_DIR"

# Récupérer la liste des releases
releases=$(gh release list --limit 100 --repo $REPO)

# Parcourir chaque release et récupérer les notes
while IFS= read -r line; do
    # Extraire le tag de la release
    tag=$(echo $line | awk '{print $1}' | sed 's/://')

    # Remplacer les caractères non valides dans le nom de fichier
    safe_tag=$(echo "$tag" | tr '/' '_')

    # Récupérer les notes de la release et les sauvegarder dans un fichier
    echo "Saving release notes for: $tag"
    gh release view $tag --repo $REPO > "$DEST_DIR/release_$safe_tag.md"
done <<< "$releases"
