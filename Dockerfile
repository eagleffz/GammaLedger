FROM nginx:alpine

# Alte Default-Seite entfernen
RUN rm -rf /usr/share/nginx/html/*

# Web-App kopieren
COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]