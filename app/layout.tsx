import type { Metadata } from 'next'
import { GeistSans } from 'geist/font/sans'
import './globals.css'
import { AuthProvider } from '@/lib/auth-context'
import { AuthModalProvider } from '@/lib/auth-modal-context'
import { AuthModal } from '@/components/auth-modal'

export const metadata: Metadata = {
  title: 'Photo Filter App',
  description: 'Application de filtres photo avec intelligence artificielle',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="fr" suppressHydrationWarning>
      <body className={GeistSans.className}>
        <AuthProvider>
          <AuthModalProvider>
            {children}
            <AuthModal />
          </AuthModalProvider>
        </AuthProvider>
      </body>
    </html>
  )
}