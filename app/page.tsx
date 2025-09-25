'use client'

import { useAuth } from '@/lib/auth-context'
import { UserMenu } from '@/components/user-menu'
import { Button } from '@/components/ui/button'
import { useAuthModal } from '@/lib/auth-modal-context'
import { useRouter } from 'next/navigation'

export default function HomePage() {
  const { user, loading } = useAuth()
  const { openModal } = useAuthModal()
  const router = useRouter()

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

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <header className="bg-white shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            <div className="flex items-center">
              <h1 className="text-2xl font-bold text-gray-900">
                📸 Photo Filter App
              </h1>
            </div>
            <UserMenu />
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
        <div className="text-center">
          <h2 className="text-4xl font-extrabold text-gray-900 sm:text-5xl">
            Transformez vos photos avec l'IA
          </h2>
          <p className="mt-4 max-w-2xl mx-auto text-xl text-gray-500">
            Appliquez des filtres intelligents et créez des images époustouflantes
          </p>

          {user ? (
            <div className="mt-8">
              <div className="bg-green-50 border border-green-200 rounded-lg p-6 max-w-md mx-auto">
                <div className="flex items-center">
                  <div className="flex-shrink-0">
                    <div className="h-8 w-8 bg-green-100 rounded-full flex items-center justify-center">
                      ✅
                    </div>
                  </div>
                  <div className="ml-3">
                    <h3 className="text-sm font-medium text-green-800">
                      Connecté avec succès !
                    </h3>
                    <div className="mt-2 text-sm text-green-700">
                      <p>Bienvenue {user.user_metadata?.full_name || user.email}</p>
                    </div>
                  </div>
                </div>
              </div>
              
              <div className="mt-8 space-y-4">
                <Button 
                  size="lg" 
                  className="bg-indigo-600 hover:bg-indigo-700 text-white px-8 py-3 text-lg"
                  onClick={() => router.push('/?camera=true')}
                >
                  🎥 Ouvrir la Caméra
                </Button>
                
                <div className="text-sm text-gray-500">
                  <p>L'authentification fonctionne correctement !</p>
                </div>
              </div>
            </div>
          ) : (
            <div className="mt-8">
              <Button 
                onClick={openModal}
                size="lg" 
                className="bg-indigo-600 hover:bg-indigo-700 text-white px-8 py-3 text-lg"
              >
                Commencer maintenant
              </Button>
              <p className="mt-4 text-sm text-gray-500">
                Connectez-vous pour accéder à toutes les fonctionnalités
              </p>
            </div>
          )}

          <div className="mt-16 grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
            <div className="bg-white rounded-lg shadow-md p-6">
              <div className="text-3xl mb-4">🎨</div>
              <h3 className="text-lg font-semibold text-gray-900 mb-2">
                Filtres Intelligents
              </h3>
              <p className="text-gray-600">
                Appliquez des filtres basés sur l'IA pour transformer vos photos
              </p>
            </div>

            <div className="bg-white rounded-lg shadow-md p-6">
              <div className="text-3xl mb-4">⚡</div>
              <h3 className="text-lg font-semibold text-gray-900 mb-2">
                Traitement Rapide
              </h3>
              <p className="text-gray-600">
                Obtenez vos images transformées en quelques secondes
              </p>
            </div>

            <div className="bg-white rounded-lg shadow-md p-6">
              <div className="text-3xl mb-4">💾</div>
              <h3 className="text-lg font-semibold text-gray-900 mb-2">
                Sauvegarde Cloud
              </h3>
              <p className="text-gray-600">
                Toutes vos créations sont sauvegardées automatiquement
              </p>
            </div>
          </div>
        </div>
      </main>
    </div>
  )
}