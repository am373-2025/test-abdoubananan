'use client'

import { useAuth } from '@/lib/auth-context'
import { UserMenu } from '@/components/user-menu'
import { Button } from '@/components/ui/button'
import { useRouter } from 'next/navigation'
import { useEffect } from 'react'

export default function ProfilePage() {
  const { user, loading } = useAuth()
  const router = useRouter()

  useEffect(() => {
    if (!loading && !user) {
      router.push('/')
    }
  }, [user, loading, router])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-gray-900"></div>
          <p className="mt-4 text-lg">Chargement...</p>
        </div>
      </div>
    )
  }

  if (!user) {
    return null // Le useEffect redirige vers la page d'accueil
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <header className="bg-white shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            <div className="flex items-center space-x-4">
              <Button 
                variant="ghost" 
                onClick={() => router.push('/')}
                className="text-sm"
              >
                ← Retour
              </Button>
              <h1 className="text-2xl font-bold text-gray-900">
                👤 Mon Profil
              </h1>
            </div>
            <UserMenu />
          </div>
        </div>
      </header>

      <main className="max-w-3xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
        <div className="bg-white shadow rounded-lg">
          <div className="px-6 py-8">
            <div className="flex items-center space-x-6">
              <div className="h-24 w-24 bg-indigo-100 rounded-full flex items-center justify-center">
                <span className="text-2xl font-bold text-indigo-600">
                  {user.email?.[0]?.toUpperCase() || 'U'}
                </span>
              </div>
              
              <div className="flex-1">
                <h2 className="text-2xl font-bold text-gray-900">
                  {user.user_metadata?.full_name || 'Utilisateur'}
                </h2>
                <p className="text-gray-600 mt-1">{user.email}</p>
                <p className="text-sm text-gray-500 mt-2">
                  Membre depuis le {new Date(user.created_at).toLocaleDateString('fr-FR')}
                </p>
              </div>
            </div>

            <div className="mt-8 border-t border-gray-200 pt-8">
              <h3 className="text-lg font-semibold text-gray-900 mb-4">
                Informations du compte
              </h3>
              
              <div className="grid grid-cols-1 gap-6 sm:grid-cols-2">
                <div>
                  <label className="block text-sm font-medium text-gray-700">Email</label>
                  <div className="mt-1 text-sm text-gray-900">{user.email}</div>
                </div>
                
                <div>
                  <label className="block text-sm font-medium text-gray-700">Nom complet</label>
                  <div className="mt-1 text-sm text-gray-900">
                    {user.user_metadata?.full_name || 'Non défini'}
                  </div>
                </div>
                
                <div>
                  <label className="block text-sm font-medium text-gray-700">Statut</label>
                  <div className="mt-1">
                    <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                      Compte actif
                    </span>
                  </div>
                </div>
                
                <div>
                  <label className="block text-sm font-medium text-gray-700">Type de compte</label>
                  <div className="mt-1">
                    <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                      Gratuit
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div className="mt-8 border-t border-gray-200 pt-8">
              <h3 className="text-lg font-semibold text-gray-900 mb-4">
                Actions rapides
              </h3>
              
              <div className="space-y-3">
                <Button 
                  onClick={() => router.push('/?camera=true')}
                  className="w-full justify-start"
                  variant="outline"
                >
                  🎥 Ouvrir la Caméra
                </Button>
                
                <Button 
                  onClick={() => alert('Fonctionnalité à venir')}
                  className="w-full justify-start"
                  variant="outline"
                >
                  📸 Mes Photos
                </Button>
                
                <Button 
                  onClick={() => alert('Fonctionnalité à venir')}
                  className="w-full justify-start"
                  variant="outline"
                >
                  ⚙️ Paramètres
                </Button>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  )
}