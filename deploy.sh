#!/bin/bash

# Script de déploiement Netlify
echo "🚀 Déploiement de BananaCam sur Netlify..."

# Vérifier que nous sommes dans le bon répertoire
if [ ! -f "package.json" ]; then
    echo "❌ Erreur: package.json non trouvé. Assurez-vous d'être dans le répertoire du projet."
    exit 1
fi

# Installer les dépendances
echo "📦 Installation des dépendances..."
npm install

# Construire l'application
echo "🔨 Construction de l'application..."
npm run build

# Vérifier que le build a réussi
if [ ! -d ".next" ]; then
    echo "❌ Erreur: Le build a échoué. Le dossier .next n'existe pas."
    exit 1
fi

echo "✅ Build réussi !"
echo "📁 Dossier de publication: .next"
echo "🌐 Prêt pour le déploiement sur Netlify"
echo ""
echo "📋 Prochaines étapes:"
echo "1. Connectez votre repository GitHub à Netlify"
echo "2. Configurez les variables d'environnement:"
echo "   - NEXT_PUBLIC_SUPABASE_URL"
echo "   - NEXT_PUBLIC_SUPABASE_ANON_KEY"
echo "3. Déployez automatiquement"
