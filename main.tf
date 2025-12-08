terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Construire l'image Docker à partir du Dockerfile local
resource "docker_image" "web" {
  name = "demo-devops"
  build {
    context = "."  # dossier du projet
  }
}

# Créer le container avec volume pour le live editing
resource "docker_container" "web" {
  name  = "demo-devops-container"
  image = docker_image.web.image_id

  ports {
    internal = 80
    external = 8081  # port libre
  }

  # Volume pour synchroniser les fichiers locaux avec le container
  volumes {
    host_path      = "${path.module}/html"           # dossier local
    container_path = "/usr/share/nginx/html"        # dossier servi par Nginx
  }
}
