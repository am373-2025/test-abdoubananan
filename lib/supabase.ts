import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)

export type Database = {
  public: {
    Tables: {
      profiles: {
        Row: {
          id: string
          email: string
          full_name: string | null
          avatar_url: string | null
          is_premium: boolean
          premium_expires_at: string | null
          premium_plan: string
          created_at: string
          updated_at: string
        }
        Insert: {
          id: string
          email: string
          full_name?: string | null
          avatar_url?: string | null
          is_premium?: boolean
          premium_expires_at?: string | null
          premium_plan?: string
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          email?: string
          full_name?: string | null
          avatar_url?: string | null
          is_premium?: boolean
          premium_expires_at?: string | null
          premium_plan?: string
          created_at?: string
          updated_at?: string
        }
      }
      photos: {
        Row: {
          id: string
          user_id: string
          original_url: string
          processed_url: string | null
          filter_name: string
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          user_id: string
          original_url: string
          processed_url?: string | null
          filter_name: string
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          original_url?: string
          processed_url?: string | null
          filter_name?: string
          created_at?: string
          updated_at?: string
        }
      }
    }
  }
}