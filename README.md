# Lady First — Luxury Wholesale Website

A premium, editorial-style wholesale handbag website with a private product manager.

## Included

- Luxury fashion/editorial landing page
- Responsive mobile-first layout
- Hero campaign section
- Product collection + category filters
- Wishlist saved in the visitor's browser
- Product quick-view modal
- WhatsApp wholesale enquiry links
- Lookbook/editorial sections
- Brand story
- Wholesale benefits
- FAQ accordion
- Newsletter UI
- Floating WhatsApp button
- Private admin panel
- Add product photo + title + category + description
- Delete products
- Supabase Auth + Database + Storage integration
- Existing supplied product photos included
- GitHub/Vercel-ready static deployment

## Supabase setup

1. Create a Supabase project.
2. Open SQL Editor.
3. Run `supabase-setup.sql`.
4. Open Authentication -> Users -> create your private admin account.
5. Copy Project URL and anon/publishable key.
6. Paste both values into:
   - `index.html`
   - `admin.html`
7. Push the entire folder to GitHub.
8. Import the GitHub repository into Vercel.
9. Public site:
   `https://YOUR-DOMAIN/`
10. Private admin:
   `https://YOUR-DOMAIN/admin.html`

## Important security note

The admin password is handled by Supabase Authentication and is not stored in this repository. Do not commit service-role keys or passwords to GitHub.

## Business details currently used

Lady First
Mumbai Central, Mumbai, Maharashtra
WhatsApp: +91 81695 27047

## Future upgrades

For a full online-store workflow, connect a payment gateway, shipping system, customer accounts and an order database. The current site is intentionally wholesale-enquiry focused.
