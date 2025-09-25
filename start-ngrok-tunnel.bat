@echo off
echo 🚀 Démarrage de BananaCam avec tunnel Ngrok...
echo.

echo 📦 Démarrage du serveur de développement...
start "BananaCam Dev Server" cmd /k "npm run dev"

echo ⏳ Attente du démarrage du serveur...
timeout /t 5 /nobreak > nul

echo 🌐 Création du tunnel public avec Ngrok...
echo.
echo ✅ Votre application sera accessible via une URL Ngrok
echo.
echo 📱 Vous pouvez maintenant tester sur votre mobile sans Wi-Fi !
echo.
echo ⚠️  Appuyez sur Ctrl+C pour arrêter le tunnel
echo.

ngrok http 3000

pause
