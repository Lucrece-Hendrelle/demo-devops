FROM nginx:alpine

# Copier les fichiers du projet vers nginx
COPY . /usr/share/nginx/html

EXPOSE 80
