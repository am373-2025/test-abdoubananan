@echo off
echo 🚀 Déploiement de BananaCam sur Netlify via CLI...
echo.

echo 📦 Construction de l'application...
call npm run build

if %ERRORLEVEL% neq 0 (
    echo ❌ Erreur lors de la construction
    pause
    exit /b 1
)

echo ✅ Construction réussie !
echo.

echo 🌐 Déploiement sur Netlify...
echo.
echo 📋 Instructions :
echo 1. Connectez-vous à votre compte Netlify
echo 2. Autorisez l'accès si demandé
echo 3. Suivez les instructions à l'écran
echo.

netlify deploy --prod --dir=.next

echo.
echo ✅ Déploiement terminé !
echo 🌐 Votre application est maintenant en ligne !
echo.
pause
