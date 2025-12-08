# Dockerfile.prod
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Installer git pour cloner le repo
RUN apk add --no-cache git

# Cloner ton repo (version main)
RUN git clone https://github.com/TON_USER/TON_REPO.git .

EXPOSE 80

# Lancer Nginx en foreground
CMD ["nginx", "-g", "daemon off;"]
