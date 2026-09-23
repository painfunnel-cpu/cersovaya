-- Violet Bloom — назначение администратора
--
-- Сначала создайте пользователя через Supabase Dashboard:
-- Authentication -> Users -> Add user -> Create new user.
-- Используйте реальный email и пароль, к которым у вас есть доступ.
-- Затем замените email ниже и выполните этот SQL в SQL Editor.

update public.profiles
set role = 'admin', updated_at = now()
where id = (
  select id
  from auth.users
  where lower(email) = lower('YOUR_REAL_ADMIN_EMAIL@example.com')
);

-- Проверка назначения роли:
select p.id, u.email, p.full_name, p.role
from public.profiles p
join auth.users u on u.id = p.id
where lower(u.email) = lower('YOUR_REAL_ADMIN_EMAIL@example.com');

-- Ожидаемый результат: role = admin
--
-- Важно: не создавайте auth.users вручную через публичный фронтенд.
-- Supabase Auth должен создать пользователя через Dashboard или Auth API,
-- а этот файл только безопасно назначает ему роль после регистрации.
