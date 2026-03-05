# Ahmed Hassan — Portfolio Website

A bold, dark-themed personal portfolio for an IT & Network Engineer.
Content is managed through **Supabase** and updated live via the **Admin Panel**.

---

## 🗂 Project Structure

```
ahmed-portfolio/
├── index.html                # Main portfolio (loads data from Supabase)
├── admin.html                # Admin panel — manage all content
├── supabase-schema.sql       # Run this once in Supabase SQL Editor
├── README.md
├── css/
│   ├── reset.css
│   ├── variables.css
│   ├── base.css
│   ├── nav.css
│   ├── hero.css
│   ├── experience.css
│   ├── skills.css
│   ├── certifications.css
│   ├── clients.css
│   ├── contact.css
│   ├── footer.css
│   ├── animations.css
│   └── responsive.css
└── js/
    ├── supabase-config.js    # ← ADD YOUR KEYS HERE
    ├── data-loader.js        # Fetches data & renders portfolio
    ├── cursor.js
    └── navbar.js
```

---

## 🚀 Setup (5 Steps)

### 1 — Create a Supabase project
Go to [supabase.com](https://supabase.com) → New Project.

### 2 — Run the schema SQL
In your Supabase dashboard → **SQL Editor** → paste and run `supabase-schema.sql`.
This creates all tables, security policies, and seeds your initial content.

### 3 — Add your credentials
Open `js/supabase-config.js` and fill in:

```js
const SUPABASE_URL      = 'https://YOUR_PROJECT_REF.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ANON_KEY_HERE';
```

Find these in: Supabase Dashboard → Settings → API.

### 4 — Create an admin user
In Supabase Dashboard → **Authentication** → **Users** → **Add User**.
Use any email/password — this is your admin login.

### 5 — Open the site
Open `index.html` in a browser. Content loads from Supabase automatically.
Open `admin.html` to manage content.

> ⚠️ For production, host the files on a web server (Netlify, Vercel, GitHub Pages, etc.)
> so that the `admin.html` URL is not publicly guessable. The Supabase RLS policies
> already protect writes — only authenticated users can modify data.

---

## 🛠 Admin Panel Features

| Section       | What you can do                                   |
|---------------|---------------------------------------------------|
| **Hero**      | Edit tag, name, title, description, stats         |
| **Experience**| Add / Edit / Delete / Reorder job cards           |
| **Skills**    | Add / Edit / Delete / Set level (0–100)           |
| **Certifications** | Add / Edit / Delete credential cards        |
| **Clients**   | Add / Edit / Delete marquee clients               |
| **Contact**   | Edit location, phone, email, LinkedIn, education  |

Changes go live immediately on `index.html` — no rebuild needed.

---

## 🎨 Customization

- Edit colors in `css/variables.css`
- Edit fonts in the `<link>` tag in `index.html`
- Add a profile photo inside `assets/` and reference it in the hero section
