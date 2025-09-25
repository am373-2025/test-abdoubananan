# Script PowerShell pour démarrer BananaCam avec tunnel public
Write-Host "🚀 Démarrage de BananaCam avec tunnel public..." -ForegroundColor Green
Write-Host ""

# Démarrer le serveur de développement en arrière-plan
Write-Host "📦 Démarrage du serveur de développement..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-Command", "npm run dev" -WindowStyle Normal

# Attendre que le serveur démarre
Write-Host "⏳ Attente du démarrage du serveur..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

# Créer le tunnel public
Write-Host "🌐 Création du tunnel public..." -ForegroundColor Yellow
Write-Host ""
Write-Host "✅ Votre application sera accessible via :" -ForegroundColor Green
Write-Host "   https://bananacam-mobile-test.loca.lt" -ForegroundColor Cyan
Write-Host ""
Write-Host "📱 Vous pouvez maintenant tester sur votre mobile sans Wi-Fi !" -ForegroundColor Green
Write-Host ""
Write-Host "⚠️  Appuyez sur Ctrl+C pour arrêter le tunnel" -ForegroundColor Red
Write-Host ""

# Démarrer le tunnel
lt --port 3000 --subdomain bananacam-mobile-test
