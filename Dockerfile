FROM nginx:stable-alpine as builder

# Копіюємо вміст вашої локальної папки 'site' у стандартну папку Nginx
COPY site/ /usr/share/nginx/html

# Етап 2: Виконання (фінальний, мінімальний образ)
# Nginx вже прослуховує порт 8080 у Cloud Run
FROM nginx:stable-alpine
COPY --from=builder /usr/share/nginx/html /usr/share/nginx/html

# Порт, який Nginx буде прослуховувати.
# Cloud Run очікує, що контейнер слухає порт, вказаний змінною $PORT (за замовчуванням 8080)
EXPOSE 8080
