# 🎯 Ajout d'Abonnement Premium - admin@hotmail.fr

## 📋 **Instructions pour Ajouter l'Abonnement Premium**

### **Étape 1 : Mettre à Jour le Schéma de Base de Données**

1. **Connectez-vous** à votre dashboard Supabase
2. **Allez** dans l'onglet "SQL Editor"
3. **Exécutez** le script `supabase-schema-with-premium.sql` pour ajouter les champs premium

### **Étape 2 : Ajouter l'Abonnement Premium**

1. **Exécutez** le script `add-premium-subscription.sql` dans le SQL Editor
2. **Vérifiez** que l'utilisateur `admin@hotmail.fr` a bien été mis à jour

## 🔧 **Scripts Créés**

### **1. `supabase-schema-with-premium.sql`**
- ✅ Ajoute les champs premium à la table `profiles`
- ✅ Crée les index pour optimiser les performances
- ✅ Ajoute des fonctions utilitaires pour gérer les abonnements

### **2. `add-premium-subscription.sql`**
- ✅ Ajoute un abonnement premium à `admin@hotmail.fr`
- ✅ Définit l'expiration à 1 an
- ✅ Plan annuel (`yearly`)

## 📊 **Nouveaux Champs Ajoutés**

| Champ | Type | Description | Valeur par Défaut |
|---|---|---|---|
| `is_premium` | BOOLEAN | Statut premium de l'utilisateur | `FALSE` |
| `premium_expires_at` | TIMESTAMP | Date d'expiration de l'abonnement | `NULL` |
| `premium_plan` | TEXT | Type d'abonnement (monthly/yearly) | `'monthly'` |

## 🎯 **Résultat Attendu**

Après exécution des scripts, l'utilisateur `admin@hotmail.fr` aura :
- ✅ **Statut Premium** : `TRUE`
- ✅ **Expiration** : 1 an à partir de maintenant
- ✅ **Plan** : `yearly`
- ✅ **Accès** à tous les filtres premium

## 🔍 **Vérification**

Pour vérifier que l'abonnement a bien été ajouté :

```sql
SELECT 
  email,
  full_name,
  is_premium,
  premium_expires_at,
  premium_plan,
  updated_at
FROM profiles 
WHERE email = 'admin@hotmail.fr';
```

## 🚀 **Fonctions Utilitaires Ajoutées**

### **`is_user_premium(user_id)`**
Vérifie si un utilisateur a un abonnement premium valide.

### **`get_user_premium_status(user_id)`**
Retourne le statut complet de l'abonnement premium.

## ⚠️ **Important**

1. **Sauvegardez** votre base de données avant d'exécuter les scripts
2. **Testez** d'abord sur un environnement de développement
3. **Vérifiez** que l'utilisateur `admin@hotmail.fr` existe dans `auth.users`

## 🎉 **Après l'Exécution**

L'utilisateur `admin@hotmail.fr` pourra :
- ✅ Accéder à tous les filtres premium
- ✅ Utiliser les 100+ filtres disponibles
- ✅ Bénéficier de l'abonnement pendant 1 an

**L'abonnement premium est maintenant configuré !** 🎊
