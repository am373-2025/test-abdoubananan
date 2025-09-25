@echo off
echo 🚀 Déploiement de BananaCam sur Vercel (Recommandé pour Next.js)...
echo.

echo 📦 Installation de Vercel CLI...
call npm install -g vercel

echo ✅ Vercel CLI installé !
echo.

echo 🔧 Préparation du déploiement...
echo - Suppression du fichier pnpm-lock.yaml
if exist pnpm-lock.yaml del pnpm-lock.yaml

echo - Test du build local...
call npm run build

if %ERRORLEVEL% neq 0 (
    echo ❌ Erreur lors de la construction
    pause
    exit /b 1
)

echo ✅ Build local réussi !
echo.

echo 🌐 Déploiement sur Vercel...
echo.
echo 📋 Instructions :
echo 1. Connectez-vous à votre compte Vercel
echo 2. Autorisez l'accès si demandé
echo 3. Suivez les instructions à l'écran
echo 4. Configurez les variables d'environnement :
echo    - NEXT_PUBLIC_SUPABASE_URL
echo    - NEXT_PUBLIC_SUPABASE_ANON_KEY
echo.

vercel --prod

echo.
echo ✅ Déploiement terminé !
echo 🌐 Votre application est maintenant en ligne sur Vercel !
echo.
echo 💡 Avantages de Vercel :
echo - Optimisé pour Next.js
echo - Déploiement automatique
echo - Performance excellente
echo - Support gratuit
echo - Configuration automatique
echo.
pause
