terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
    }
  }
}

provider "docker" { }

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx1" {
  image = docker_image.nginx.image_id
  name = "nginx1"
  ports {
    internal = 80
    external = 8082
  }
}

resource "docker_container" "nginx2" {
  image = docker_image.nginx.image_id
  name = "nginx2"
  ports {
    internal = 80
    external = 8085
  }
}