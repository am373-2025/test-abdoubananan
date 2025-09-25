# Guide de déploiement Netlify

## Variables d'environnement requises

Configurez ces variables dans Netlify (Site settings > Environment variables) :

```
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

## Étapes de déploiement

1. **Connectez votre repository GitHub à Netlify**
2. **Configurez les variables d'environnement**
3. **Déployez automatiquement**

## Configuration du build

- **Build command**: `npm run build`
- **Publish directory**: `.next`
- **Node version**: 18

## Redirections

Toutes les routes sont redirigées vers `/index.html` pour le support SPA.

## Headers de sécurité

- X-Frame-Options: DENY
- X-XSS-Protection: 1; mode=block
- X-Content-Type-Options: nosniff
- Referrer-Policy: strict-origin-when-cross-origin

## Cache

- Assets statiques: 1 an
- Favicon: 1 jour
