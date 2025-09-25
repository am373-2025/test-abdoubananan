@echo off
echo 🚀 Démarrage de BananaCam avec tunnel LocalTunnel (sans mot de passe)...
echo.

echo 📦 Démarrage du serveur de développement...
start "BananaCam Dev Server" cmd /k "npm run dev"

echo ⏳ Attente du démarrage du serveur...
timeout /t 5 /nobreak > nul

echo 🌐 Création du tunnel public avec LocalTunnel...
echo.
echo ✅ Votre application sera accessible via une URL LocalTunnel
echo.
echo 📱 Vous pouvez maintenant tester sur votre mobile sans Wi-Fi !
echo.
echo ⚠️  Appuyez sur Ctrl+C pour arrêter le tunnel
echo.

REM Générer un sous-domaine aléatoire pour éviter les conflits
set /a RANDOM_SUBDOMAIN=%RANDOM% %% 10000
lt --port 3000 --subdomain bananacam-test-%RANDOM_SUBDOMAIN%

pause
