# Configuration Supabase pour abdou

Ce guide vous explique comment configurer Supabase pour votre application abdou.

## 1. Créer un projet Supabase

1. Allez sur [supabase.com](https://supabase.com)
2. Créez un compte ou connectez-vous
3. Cliquez sur "New Project"
4. Choisissez votre organisation
5. Donnez un nom à votre projet (ex: "abdou-camera-app")
6. Créez un mot de passe sécurisé pour la base de données
7. Choisissez une région proche de vos utilisateurs
8. Cliquez sur "Create new project"

## 2. Récupérer les clés API

1. Dans votre tableau de bord Supabase, allez dans **Settings** > **API**
2. Copiez les valeurs suivantes :
   - **Project URL** (ex: `https://your-project-id.supabase.co`)
   - **anon public** key

## 3. Configurer les variables d'environnement

1. Créez un fichier `.env.local` à la racine de votre projet
2. Ajoutez les variables suivantes :

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

**⚠️ Important :** Remplacez les valeurs par vos vraies clés API.

## 4. Initialiser la base de données

1. Dans votre tableau de bord Supabase, allez dans **SQL Editor**
2. Copiez le contenu du fichier `supabase-schema.sql`
3. Collez-le dans l'éditeur SQL
4. Cliquez sur **Run** pour exécuter le script

Ce script va créer :
- La table `profiles` pour les informations utilisateur
- La table `photos` pour stocker les photos
- Les politiques de sécurité (RLS)
- Les triggers pour la gestion automatique des profils

## 5. Configurer l'authentification

1. Dans votre tableau de bord Supabase, allez dans **Authentication** > **Settings**
2. Configurez les paramètres suivants :

### Site URL
```
http://localhost:3000
```
(Pour la production, remplacez par votre domaine)

### Redirect URLs
```
http://localhost:3000/auth/callback
http://localhost:3000/**
```

### Email Templates (optionnel)
Vous pouvez personnaliser les emails de confirmation et de réinitialisation de mot de passe.

## 6. Tester la connexion

1. Démarrez votre application :
```bash
npm run dev
```

2. Ouvrez [http://localhost:3000](http://localhost:3000)
3. Cliquez sur "Se connecter" dans le coin supérieur droit
4. Testez l'inscription et la connexion

## 7. Fonctionnalités disponibles

Une fois configuré, votre application aura :

### Authentification
- ✅ Inscription avec email/mot de passe
- ✅ Connexion/déconnexion
- ✅ Gestion des profils utilisateur
- ✅ Réinitialisation de mot de passe

### Base de données
- ✅ Stockage des profils utilisateur
- ✅ Stockage des photos avec métadonnées
- ✅ Sécurité au niveau des lignes (RLS)
- ✅ API REST automatique

### Sécurité
- ✅ Politiques de sécurité configurées
- ✅ Accès restreint aux données utilisateur
- ✅ Galerie publique pour les photos traitées

## 8. Déploiement en production

Pour déployer en production :

1. Mettez à jour les variables d'environnement avec vos vraies clés
2. Configurez les URLs de redirection dans Supabase
3. Déployez votre application sur Vercel, Netlify, ou votre plateforme préférée

## 9. Monitoring et maintenance

- Surveillez l'utilisation dans le tableau de bord Supabase
- Configurez des alertes pour les erreurs
- Sauvegardez régulièrement votre base de données
- Mettez à jour les dépendances régulièrement

## Support

Si vous rencontrez des problèmes :
1. Vérifiez les logs dans le tableau de bord Supabase
2. Consultez la [documentation Supabase](https://supabase.com/docs)
3. Vérifiez que vos variables d'environnement sont correctes
