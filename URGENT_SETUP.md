# 🚨 URGENT - Configuration Supabase Requise

## ❌ Erreur Détectée

Vous avez une erreur **400 (Bad Request)** lors de la tentative de connexion :
```
POST https://qqjtszchzbdtflzptfaw.supabase.co/auth/v1/token?grant_type=password 400 (Bad Request)
```

## 🔧 Solution Immédiate

### 1. **Initialiser la Base de Données** (OBLIGATOIRE)

Vous devez exécuter le script SQL dans votre tableau de bord Supabase :

#### Étapes :
1. **Allez sur** [supabase.com](https://supabase.com)
2. **Connectez-vous** et ouvrez votre projet `qqjtszchzbdtflzptfaw`
3. **Allez dans** **SQL Editor** (dans le menu de gauche)
4. **Copiez** le contenu complet du fichier `supabase-schema.sql`
5. **Collez-le** dans l'éditeur SQL
6. **Cliquez sur** **Run** pour exécuter le script

### 2. **Vérifier la Configuration**

Après avoir exécuté le script, vérifiez que :
- ✅ Les tables `profiles` et `photos` sont créées
- ✅ Les politiques RLS sont activées
- ✅ Les triggers sont configurés

### 3. **Tester la Connexion**

Une fois le script exécuté :
1. **Rafraîchissez** votre application (`http://localhost:3003`)
2. **Testez** l'inscription avec un nouvel email
3. **Vérifiez** que la connexion fonctionne

## 📋 Contenu du Script SQL

Le fichier `supabase-schema.sql` contient :
- ✅ Création des tables `profiles` et `photos`
- ✅ Configuration des politiques de sécurité (RLS)
- ✅ Triggers pour la gestion automatique des profils
- ✅ Index pour optimiser les performances

## 🎯 Résultat Attendu

Après l'exécution du script :
- ✅ **Inscription** : Fonctionnera sans erreur
- ✅ **Connexion** : Fonctionnera sans erreur 400
- ✅ **Base de données** : Prête à stocker les photos
- ✅ **Sécurité** : Politiques RLS configurées

## 🚨 Important

**Sans cette étape, l'authentification ne fonctionnera pas !**

L'erreur 400 indique que Supabase ne trouve pas les tables nécessaires pour l'authentification et la gestion des profils utilisateur.

---

**Action requise** : Exécutez le script SQL dans Supabase maintenant pour que votre application fonctionne correctement.
