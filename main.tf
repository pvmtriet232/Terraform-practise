terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "kiada" {
  name         = "pvmtriet233/kiada:0.2"
  keep_locally = false
}

resource "docker_container" "kiada" {
  image = docker_image.kiada.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}
