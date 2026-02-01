FROM nginx:alpine

# Default-Content entfernen
RUN rm -rf /usr/share/nginx/html/*

# Nur den src-Ordner ins Webroot kopieren
COPY src/ /usr/share/nginx/html/

# Rechte setzen (vermeidet 403 durch Permissions)
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]