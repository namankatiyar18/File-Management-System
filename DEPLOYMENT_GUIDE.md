# Filequh — Deployment Guide

This guide details how to deploy the Filequh File Management System to production.

---

## 1. Architecture Overview

- **Frontend**: Next.js 16 (App Router) — Deployed to [Vercel](https://vercel.com) or Netlify.
- **Backend API**: Node.js / Express — Deployed to [Render](https://render.com), [Railway](https://railway.app), or DigitalOcean App Platform.
- **Database & Storage**: [Supabase](https://supabase.com) (Managed PostgreSQL + Object Storage).

---

## 2. Supabase Setup

1. Create a new project at [supabase.com](https://supabase.com).
2. Open the **SQL Editor** in your Supabase dashboard.
3. Run the SQL script from [`scripts/001_create_tables.sql`](./scripts/001_create_tables.sql) to create:
   - `profiles`, `folders`, `files`, `shares`, `activity_logs` tables
   - Row-Level Security (RLS) policies
   - Auto-profile creation trigger on user registration
   - Storage calculation functions
4. Run [`scripts/002_storage_bucket.sql`](./scripts/002_storage_bucket.sql) to configure:
   - Private `files` storage bucket
   - 50 MB upload limits and allowed MIME types
   - User folder isolation policies
5. In **Project Settings > API**, copy:
   - Project URL
   - `anon` `public` API key
   - `service_role` secret key

---

## 3. Backend Deployment (Render / Railway)

1. Connect your Git repository to Render or Railway.
2. Set the **Root Directory** to `backend`.
3. Set **Build Command**: `npm install && npm run build`
4. Set **Start Command**: `npm start`
5. Configure Environment Variables:
   ```env
   PORT=5000
   NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
   SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
   ```

---

## 4. Frontend Deployment (Vercel)

1. Import the project into Vercel.
2. Set the **Root Directory** to `frontend`.
3. Set **Framework Preset**: `Next.js`.
4. Configure Environment Variables:
   ```env
   BACKEND_URL=https://your-backend-service.onrender.com
   NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
   ```
5. Click **Deploy**.

---

## 5. Local Production Test

To test production mode locally:

```powershell
# Build and run backend
cd backend
npm run build
npm start

# In another terminal, build and run frontend
cd frontend
npm run build
npm start
```
