FROM nginx:1.24.0-alpine as builder

# Копіюємо конфігурацію, щоб Nginx слухав порт 8080
# Цей шлях правильний
COPY nginx.conf /etc/nginx/nginx.conf 

# Копіюємо вміст сайту
# Цей шлях правильний
COPY site/ /usr/share/nginx/html

# фінальний образ
FROM nginx:1.24.0-alpine

# КОПІЮЙТЕ КОНФІГУРАЦІЮ З ПРАВИЛЬНОГО ШЛЯХУ (з /etc/nginx/nginx.conf, куди ви його поклали на етапі builder)
COPY --from=builder /etc/nginx/nginx.conf /etc/nginx/nginx.conf

# КОПІЮЙТЕ ВМІСТ САЙТУ
COPY --from=builder /usr/share/nginx/html /usr/share/nginx/html

# Порт 8080 тепер слухається завдяки nginx.conf, але EXPOSE краще залишити
EXPOSE 8080
