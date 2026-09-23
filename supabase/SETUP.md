# Violet Bloom — подключение Supabase

## 1. Применить базу

Откройте Supabase Dashboard → **SQL Editor** → New query, вставьте содержимое файла `schema.sql` и нажмите Run.

Скрипт создаёт таблицы:

- `profiles` — профиль пользователя и роль `customer` / `admin`;
- `products` — каталог букетов;
- `orders` — заказы и статусы;
- `order_items` — состав заказов.

Также создаются триггеры для профиля пользователя, индексы и RLS-политики.

## 2. Создать администратора

1. Откройте Authentication → Users → Add user → Create new user.
2. Укажите реальный email и пароль администратора.
3. Скопируйте UUID созданного пользователя.
4. Выполните в SQL Editor:

```sql
update public.profiles
set role = 'admin'
where id = 'UUID_ПОЛЬЗОВАТЕЛЯ';
```

После этого администратор сможет войти через кнопку «Админка» и работать с заказами.

## 3. Auth settings

Для учебного проекта можно включить подтверждение email или отключить его в Authentication → Providers → Email. Если подтверждение включено, пользователь должен подтвердить email из письма перед входом.

## 4. Storage

Для реальных изображений можно создать публичный bucket `bouquets`, загрузить туда изображения и записать URL в `products.image_url`. Текущий интерфейс использует локально загруженные изображения как fallback, поэтому каталог продолжает отображаться до заполнения `image_url`.

## 5. Безопасность

В проекте используется только `VITE_SUPABASE_URL` и публичный `VITE_SUPABASE_ANON_KEY`. Никогда не добавляйте `service_role` key в браузерный код, GitHub или Vercel environment variables с префиксом `VITE_`.
