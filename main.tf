resource "docker_container" "web" {
  name  = "demo-devops-container"
  image = docker_image.web.image_id

  ports {
    internal = 80
    external = 8081
  }

  volumes {
    host_path      = "${path.module}/html"  # dossier local
    container_path = "/usr/share/nginx/html"  # dossier Nginx dans le container
  }
}
