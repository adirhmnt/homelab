terraform {
 required_providers {
   docker = {
     source  = "kreuzwerker/docker"
     version = "3.0.2"
   }
 }
}

resource "docker_container" "adi-nginx" {
  name                  = "adi-nginx"
  image                 = docker_image.nginx.image_id
  cpu_set               = "1"
  memory                = "300"
  destroy_grace_seconds = "60"
  ports {
    internal            = 80
    external            = 8000
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}