-- Script pour ajouter un abonnement premium à l'utilisateur admin@hotmail.fr

-- 1. Ajouter le champ is_premium à la table profiles (si il n'existe pas)
ALTER TABLE profiles 
ADD COLUMN IF NOT EXISTS is_premium BOOLEAN DEFAULT FALSE;

-- 2. Ajouter le champ premium_expires_at pour gérer l'expiration (si il n'existe pas)
ALTER TABLE profiles 
ADD COLUMN IF NOT EXISTS premium_expires_at TIMESTAMP WITH TIME ZONE;

-- 3. Ajouter le champ premium_plan pour le type d'abonnement (si il n'existe pas)
ALTER TABLE profiles 
ADD COLUMN IF NOT EXISTS premium_plan TEXT DEFAULT 'monthly';

-- 4. Mettre à jour l'utilisateur admin@hotmail.fr avec un abonnement premium
UPDATE profiles 
SET 
  is_premium = TRUE,
  premium_expires_at = NOW() + INTERVAL '1 year', -- Abonnement valide 1 an
  premium_plan = 'yearly',
  updated_at = NOW()
WHERE email = 'admin@hotmail.fr';

-- 5. Vérifier que la mise à jour a bien fonctionné
SELECT 
  id,
  email,
  full_name,
  is_premium,
  premium_expires_at,
  premium_plan,
  created_at,
  updated_at
FROM profiles 
WHERE email = 'admin@hotmail.fr';

-- 6. Si l'utilisateur n'existe pas, créer un profil pour admin@hotmail.fr
-- (Cette partie sera exécutée seulement si l'utilisateur n'existe pas)
INSERT INTO profiles (id, email, full_name, is_premium, premium_expires_at, premium_plan)
SELECT 
  gen_random_uuid(), -- Générer un UUID temporaire
  'admin@hotmail.fr',
  'Administrateur',
  TRUE,
  NOW() + INTERVAL '1 year',
  'yearly'
WHERE NOT EXISTS (
  SELECT 1 FROM profiles WHERE email = 'admin@hotmail.fr'
);

-- 7. Afficher tous les utilisateurs premium pour vérification
SELECT 
  email,
  full_name,
  is_premium,
  premium_expires_at,
  premium_plan
FROM profiles 
WHERE is_premium = TRUE
ORDER BY created_at DESC;
