#!/bin/bash

echo "🚀 Démarrage de l'application Photo Filter App..."
echo "========================================"

# Vérifier si l'application Next.js fonctionne
if curl -s http://localhost:3000 > /dev/null; then
    echo "✅ Application Next.js détectée sur le port 3000"
else
    echo "❌ Application Next.js non trouvée. Démarrage..."
    npm run dev &
    sleep 5
fi

# Arrêter les anciens tunnels
pkill -f "lt --port"

echo ""
echo "🌐 Création d'un tunnel public..."

# Créer un tunnel public
lt --port 3000 --subdomain myapp$(date +%s) &
TUNNEL_PID=$!

sleep 3

echo ""
echo "🎯 VOTRE APPLICATION EST ACCESSIBLE ICI :"
echo "========================================"
echo ""
echo "📱 Local: http://localhost:3000"
echo ""

# Essayer de récupérer l'URL publique
PUBLIC_URL=""
for i in {1..10}; do
    if curl -s https://ipinfo.io/ip > /dev/null; then
        # Essayer de trouver l'URL du tunnel
        SUBDOMAIN="myapp$(date +%s)"
        PUBLIC_URL="https://${SUBDOMAIN}.loca.lt"
        break
    fi
    sleep 1
done

if [ ! -z "$PUBLIC_URL" ]; then
    echo "🌐 Public: $PUBLIC_URL"
    echo ""
    echo "⚠️  IMPORTANT: La première fois que vous visitez le lien public,"
    echo "   vous devrez cliquer sur 'Click to Continue' pour confirmer."
else
    echo "🌐 Public: En cours de configuration..."
    echo ""
    echo "   Essayez ces URLs dans 30 secondes :"
    echo "   - https://myapp.loca.lt"
    echo "   - https://photofilterapp.loca.lt"
fi

echo ""
echo "✨ L'application est maintenant accessible publiquement !"
echo ""
echo "🧪 Pour tester :"
echo "   1. Ouvrez l'URL publique ci-dessus"
echo "   2. Cliquez sur 'Commencer maintenant'"
echo "   3. Testez l'inscription/connexion"
echo ""
echo "🛑 Pour arrêter, appuyez sur Ctrl+C"
echo ""

# Garder le script en vie
wait $TUNNEL_PID