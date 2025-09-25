@echo off
echo 🚀 Démarrage de BananaCam avec tunnel public...
echo.

echo 📦 Démarrage du serveur de développement...
start "BananaCam Dev Server" cmd /k "npm run dev"

echo ⏳ Attente du démarrage du serveur...
timeout /t 5 /nobreak > nul

echo 🌐 Création du tunnel public...
echo.
echo ✅ Votre application sera accessible via :
echo    https://bananacam-mobile-test.loca.lt
echo.
echo 📱 Vous pouvez maintenant tester sur votre mobile sans Wi-Fi !
echo.
echo ⚠️  Appuyez sur Ctrl+C pour arrêter le tunnel
echo.

lt --port 3000 --subdomain bananacam-mobile-test

pause
