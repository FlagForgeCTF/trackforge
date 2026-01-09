
group "default" {
  targets = ["web", "webconsole", "socat_static"]
}

target "web" {
  context = "./"
  dockerfile = "Dockerfile"
  output = ["type=registry"]
  tags = ["docker.io/flagforge/trackforge:latest",
          "docker.io/flagforge/trackforge:4.0" ,
          "docker.io/flagforge/trackforge:4.0.0" ]
  platforms = ["linux/amd64", "linux/arm64", "linux/arm/v7"]
}

target "webconsole" {
  context = "./webconsole/webconsole/"
  dockerfile = "Dockerfile"
  output = ["type=registry"]
  tags = ["docker.io/flagforge/webconsole:latest",
          "docker.io/flagforge/webconsole:1.1.0"]
  platforms = ["linux/amd64", "linux/arm64", "linux/arm/v7"]
}

target "socat_static" {
  context = "./webconsole/socat_static/"
  dockerfile = "Dockerfile"
  output = ["type=registry"]
  tags = ["docker.io/flagforge/socat_static:latest",
          "docker.io/flagforge/socat_static:1.7",
          "docker.io/flagforge/socat_static:1.7.3",
          "docker.io/flagforge/socat_static:1.7.3.3"]
  platforms = ["linux/amd64", "linux/arm64", "linux/arm/v7"]
}

