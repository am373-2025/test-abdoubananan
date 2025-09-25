-- Script SQL corrigé pour Supabase - Gère les éléments existants

-- Création de la table profiles (si elle n'existe pas)
CREATE TABLE IF NOT EXISTS profiles (
  id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  email TEXT NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Création de la table photos (si elle n'existe pas)
CREATE TABLE IF NOT EXISTS photos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  original_url TEXT NOT NULL,
  processed_url TEXT,
  filter_name TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Création des index pour améliorer les performances (si ils n'existent pas)
CREATE INDEX IF NOT EXISTS idx_photos_user_id ON photos(user_id);
CREATE INDEX IF NOT EXISTS idx_photos_created_at ON photos(created_at);
CREATE INDEX IF NOT EXISTS idx_photos_filter_name ON photos(filter_name);

-- Fonction pour mettre à jour automatiquement updated_at (si elle n'existe pas)
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Suppression des triggers existants (s'ils existent)
DROP TRIGGER IF EXISTS update_profiles_updated_at ON profiles;
DROP TRIGGER IF EXISTS update_photos_updated_at ON photos;

-- Création des triggers pour mettre à jour automatiquement updated_at
CREATE TRIGGER update_profiles_updated_at 
  BEFORE UPDATE ON profiles 
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_photos_updated_at 
  BEFORE UPDATE ON photos 
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Politique RLS (Row Level Security) pour les profiles
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Suppression des politiques existantes (si elles existent)
DROP POLICY IF EXISTS "Users can view own profile" ON profiles;
DROP POLICY IF EXISTS "Users can update own profile" ON profiles;
DROP POLICY IF EXISTS "Users can insert own profile" ON profiles;

-- Les utilisateurs peuvent voir et modifier leur propre profil
CREATE POLICY "Users can view own profile" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

-- Politique RLS pour les photos
ALTER TABLE photos ENABLE ROW LEVEL SECURITY;

-- Suppression des politiques existantes (si elles existent)
DROP POLICY IF EXISTS "Users can view own photos" ON photos;
DROP POLICY IF EXISTS "Users can insert own photos" ON photos;
DROP POLICY IF EXISTS "Users can update own photos" ON photos;
DROP POLICY IF EXISTS "Users can delete own photos" ON photos;
DROP POLICY IF EXISTS "Public can view processed photos" ON photos;

-- Les utilisateurs peuvent voir leurs propres photos
CREATE POLICY "Users can view own photos" ON photos
  FOR SELECT USING (auth.uid() = user_id);

-- Les utilisateurs peuvent insérer leurs propres photos
CREATE POLICY "Users can insert own photos" ON photos
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Les utilisateurs peuvent mettre à jour leurs propres photos
CREATE POLICY "Users can update own photos" ON photos
  FOR UPDATE USING (auth.uid() = user_id);

-- Les utilisateurs peuvent supprimer leurs propres photos
CREATE POLICY "Users can delete own photos" ON photos
  FOR DELETE USING (auth.uid() = user_id);

-- Politique pour permettre la lecture publique des photos traitées (pour la galerie)
CREATE POLICY "Public can view processed photos" ON photos
  FOR SELECT USING (processed_url IS NOT NULL);

-- Fonction pour créer automatiquement un profil lors de l'inscription (si elle n'existe pas)
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    NEW.raw_user_meta_data->>'full_name',
    NEW.raw_user_meta_data->>'avatar_url'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Suppression du trigger existant (s'il existe)
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

-- Trigger pour créer automatiquement un profil
CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
