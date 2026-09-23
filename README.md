# Violet Bloom

Статический сайт заказа букетов: Vercel + GitHub + Supabase.

## Быстрый запуск
1. Создайте Supabase project.
2. Откройте SQL Editor и выполните `supabase/schema.sql`.
3. В Authentication создайте `admin@violet-bloom.local` с паролем `VioletAdmin_2026!`.
4. Выполните `supabase/admin.sql`.
5. В `index.html` замените `SUPABASE_URL` и `SUPABASE_ANON_KEY` на данные Supabase.
6. Загрузите папку в GitHub.
7. В Vercel: Framework Preset = Other, Build Command/Output Directory пустые, Root Directory = `.`.

Если Supabase ещё не настроен, сайт запускается в demo-режиме с localStorage. Это удобно для проверки интерфейса; для курсовой после подключения Supabase все CRUD-операции идут в PostgreSQL.

## Администратор
Email: `admin@violet-bloom.local`
Пароль: `VioletAdmin_2026!`

Не храните service_role key во фронтенде. Используйте только anon/publishable key.
