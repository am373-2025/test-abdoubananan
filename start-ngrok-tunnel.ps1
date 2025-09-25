# Script PowerShell pour démarrer BananaCam avec tunnel Ngrok
Write-Host "🚀 Démarrage de BananaCam avec tunnel Ngrok..." -ForegroundColor Green
Write-Host ""

# Démarrer le serveur de développement en arrière-plan
Write-Host "📦 Démarrage du serveur de développement..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-Command", "npm run dev" -WindowStyle Normal

# Attendre que le serveur démarre
Write-Host "⏳ Attente du démarrage du serveur..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

# Créer le tunnel public avec Ngrok
Write-Host "🌐 Création du tunnel public avec Ngrok..." -ForegroundColor Yellow
Write-Host ""
Write-Host "✅ Votre application sera accessible via une URL Ngrok" -ForegroundColor Green
Write-Host ""
Write-Host "📱 Vous pouvez maintenant tester sur votre mobile sans Wi-Fi !" -ForegroundColor Green
Write-Host ""
Write-Host "⚠️  Appuyez sur Ctrl+C pour arrêter le tunnel" -ForegroundColor Red
Write-Host ""

# Démarrer Ngrok
ngrok http 3000
