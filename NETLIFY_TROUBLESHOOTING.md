# 🔧 Dépannage Netlify - Guide de résolution

## 🚨 Erreurs identifiées

### **Erreurs de connexion :**
- `net::ERR_CONNECTION_RESET` - Problème de connexion réseau
- `500 Internal Server Error` - Erreur serveur côté Netlify
- `401 Unauthorized` - Problème d'authentification

## ✅ Solutions

### **1. Déploiement via CLI (Recommandé)**

#### **Avantages :**
- ✅ Contourne les problèmes de navigateur
- ✅ Authentification directe
- ✅ Déploiement plus fiable
- ✅ Logs détaillés

#### **Utilisation :**
```bash
# Script automatique
deploy-netlify-cli.bat

# Ou manuellement
npm run build
netlify deploy --prod --dir=.next
```

### **2. Déploiement manuel**

#### **Étapes :**
1. **Construire l'application :**
   ```bash
   npm run build
   ```

2. **Zipper le dossier .next :**
   - Compressez le dossier `.next`
   - Nommez le fichier `bananacam-build.zip`

3. **Déployer sur Netlify :**
   - Allez sur [netlify.com](https://netlify.com)
   - Glissez-déposez le fichier ZIP
   - Configurez les variables d'environnement

### **3. Déploiement via GitHub**

#### **Configuration :**
1. **Pousser le code sur GitHub :**
   ```bash
   git add .
   git commit -m "Ready for Netlify deployment"
   git push origin master
   ```

2. **Connecter GitHub à Netlify :**
   - Créez un nouveau site sur Netlify
   - Connectez votre repository GitHub
   - Configurez les paramètres de build

## 🔧 Configuration requise

### **Variables d'environnement :**
```
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

### **Paramètres de build :**
- **Build command :** `npm run build`
- **Publish directory :** `.next`
- **Node version :** 18

## 🚀 Alternatives de déploiement

### **1. Vercel (Recommandé pour Next.js)**
```bash
npm install -g vercel
vercel --prod
```

### **2. Railway**
```bash
npm install -g @railway/cli
railway login
railway deploy
```

### **3. Render**
- Connectez votre repository GitHub
- Configurez les paramètres de build
- Déployez automatiquement

## 📊 Comparaison des plateformes

| Plateforme | Next.js | Gratuit | Facile | Performance |
|------------|---------|---------|--------|-------------|
| **Vercel** | ⭐⭐⭐⭐⭐ | ✅ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Netlify** | ⭐⭐⭐⭐ | ✅ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Railway** | ⭐⭐⭐⭐ | ✅ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Render** | ⭐⭐⭐ | ✅ | ⭐⭐⭐ | ⭐⭐⭐ |

## 🔍 Dépannage avancé

### **Problème : Erreur 500**
- **Cause :** Variables d'environnement manquantes
- **Solution :** Vérifiez la configuration des variables

### **Problème : Build échoue**
- **Cause :** Dépendances manquantes
- **Solution :** `npm install` avant le build

### **Problème : 401 Unauthorized**
- **Cause :** Problème d'authentification
- **Solution :** Reconnectez-vous à Netlify

### **Problème : Connexion refusée**
- **Cause :** Problème réseau/firewall
- **Solution :** Utilisez le CLI ou changez de plateforme

## 📞 Support

### **En cas de problème persistant :**
1. **Vérifiez les logs** dans Netlify
2. **Testez localement** : `npm run build && npm start`
3. **Essayez Vercel** comme alternative
4. **Contactez le support** Netlify

### **Logs utiles :**
- **Build logs** : Dans l'interface Netlify
- **Deploy logs** : Via CLI Netlify
- **Local logs** : `npm run build`

## 🎯 Recommandation

**Utilisez Vercel** pour Next.js :
- Optimisé pour Next.js
- Déploiement plus simple
- Meilleure performance
- Support excellent

Votre application BananaCam peut être déployée sur plusieurs plateformes ! 🚀
