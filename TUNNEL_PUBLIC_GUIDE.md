# 🌐 Guide d'utilisation du tunnel public

## 🚀 Démarrage rapide

### Option 1 : Script automatique (Recommandé)
```bash
# Double-cliquez sur le fichier
start-public-tunnel.bat
```

### Option 2 : Script PowerShell
```powershell
# Exécutez dans PowerShell
.\start-public-tunnel.ps1
```

### Option 3 : Commandes manuelles
```bash
# Terminal 1 : Démarrer le serveur
npm run dev

# Terminal 2 : Créer le tunnel
lt --port 3000 --subdomain bananacam-mobile-test
```

## 📱 URL publique

Votre application sera accessible via :
```
https://bananacam-mobile-test.loca.lt
```

## ✨ Avantages du tunnel public

### 🌍 Accès universel
- **Sans Wi-Fi** : Fonctionne avec n'importe quelle connexion Internet
- **N'importe où** : Accessible depuis le monde entier
- **Partage facile** : URL simple à partager

### 🔒 Sécurité
- **HTTPS** : Connexion sécurisée
- **Temporaire** : Tunnel actif uniquement pendant l'utilisation
- **Contrôle** : Vous pouvez l'arrêter à tout moment

### 📊 Performance
- **CDN** : Distribution mondiale
- **Optimisé** : Connexion directe
- **Stable** : Service fiable

## 🛠️ Utilisation

### 1. Démarrer le tunnel
- Exécutez le script `start-public-tunnel.bat`
- Attendez que l'URL soit générée

### 2. Tester sur mobile
- Ouvrez le navigateur sur votre mobile
- Tapez l'URL : `https://bananacam-mobile-test.loca.lt`
- Acceptez le certificat si demandé

### 3. Fonctionnalités à tester
- **Caméra** : Prise de photos
- **Filtres** : Application des effets
- **Sauvegarde** : Stockage des images
- **Authentification** : Connexion/inscription
- **Galerie** : Visualisation des images

## ⚠️ Points importants

### Limitations
- **Tunnel temporaire** : S'arrête quand vous fermez le terminal
- **URL changeante** : Peut changer à chaque redémarrage
- **Développement uniquement** : Ne pas utiliser en production

### Dépannage
- **Erreur de certificat** : Acceptez le certificat dans le navigateur
- **Tunnel fermé** : Redémarrez le script
- **URL non accessible** : Vérifiez que le serveur fonctionne

## 🔧 Configuration avancée

### Changer le sous-domaine
```bash
lt --port 3000 --subdomain votre-nom-personnalise
```

### Tunnel avec authentification
```bash
lt --port 3000 --subdomain bananacam-mobile-test --local-host 127.0.0.1
```

### Tunnel avec domaine personnalisé
```bash
lt --port 3000 --subdomain bananacam-mobile-test --local-host 0.0.0.0
```

## 📞 Support

### En cas de problème
1. **Vérifiez le serveur** : `netstat -an | findstr :3000`
2. **Redémarrez le tunnel** : Fermez et relancez le script
3. **Vérifiez la connexion** : Testez l'URL dans un navigateur

### Logs utiles
- **Serveur** : Terminal avec `npm run dev`
- **Tunnel** : Terminal avec `lt --port 3000`
- **Navigateur** : Console de développement (F12)

## 🎯 Cas d'usage

### Développement mobile
- Test sur différents appareils
- Démonstration à distance
- Feedback utilisateur

### Tests de performance
- Vitesse de chargement
- Responsive design
- Fonctionnalités PWA

### Partage d'application
- Démonstration client
- Tests utilisateur
- Validation de fonctionnalités

Votre application BananaCam est maintenant accessible publiquement ! 🎉📱
