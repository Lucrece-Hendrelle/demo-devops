terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "web" {
  name = "demo-devops"
  build {
    context = "."  # dossier du projet
  }
}

resource "docker_container" "web" {
  name  = "demo-devops-container"
  image = docker_image.web.image_id

  ports {
    internal = 80
    external = 8081
  }

  volumes {
    host_path      = "C:/Users/LENOVO/OneDrive/Documents/demo-devops/html"
    container_path = "/usr/share/nginx/html"
  }
}
