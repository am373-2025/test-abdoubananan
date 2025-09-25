# 🍌 BananaCam - Guide de déploiement Netlify

## 🚀 Déploiement rapide

### 1. Préparation du repository

```bash
# Cloner le repository
git clone <votre-repo-url>
cd nanonbannanaapp

# Installer les dépendances
npm install

# Tester le build localement
npm run build
```

### 2. Configuration Netlify

#### A. Créer un nouveau site
1. Allez sur [netlify.com](https://netlify.com)
2. Cliquez sur "New site from Git"
3. Connectez votre repository GitHub
4. Sélectionnez le repository `nanonbannanaapp`

#### B. Configuration du build
- **Build command**: `npm run build`
- **Publish directory**: `.next`
- **Node version**: 18

#### C. Variables d'environnement
Dans Site settings > Environment variables, ajoutez :

```
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

### 3. Déploiement automatique

Une fois configuré, Netlify déploiera automatiquement à chaque push sur la branche principale.

## 🔧 Configuration avancée

### Redirections SPA
Le fichier `netlify.toml` configure automatiquement les redirections pour une SPA.

### Headers de sécurité
- Protection XSS
- Protection contre le clickjacking
- Headers de cache optimisés

### Cache
- Assets statiques: 1 an
- Favicon: 1 jour

## 📱 Fonctionnalités PWA

L'application est configurée comme PWA avec :
- Manifest.json
- Service Worker
- Icônes adaptatives
- Installation sur mobile

## 🐛 Dépannage

### Erreur de build
```bash
# Vérifier les dépendances
npm install

# Nettoyer le cache
rm -rf .next node_modules
npm install
npm run build
```

### Variables d'environnement
Assurez-vous que toutes les variables sont configurées dans Netlify.

### Problèmes de cache
Utilisez "Clear cache and deploy site" dans Netlify.

## 📊 Monitoring

- **Analytics**: Intégré avec Vercel Analytics
- **Performance**: Monitoring automatique
- **Erreurs**: Logs dans Netlify

## 🔒 Sécurité

- Variables d'environnement sécurisées
- Headers de sécurité configurés
- HTTPS automatique
- Protection CSRF

## 📞 Support

Pour toute question sur le déploiement, consultez :
- [Documentation Netlify](https://docs.netlify.com)
- [Documentation Next.js](https://nextjs.org/docs)
- [Documentation Supabase](https://supabase.com/docs)
