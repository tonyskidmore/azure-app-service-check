# azure-app-service-check

Azure App Service Environment testing.

## Build and Test summary

````bash

docker build -t azure-app-service-check -f Dockerfile .

docker run -d -it --rm --name azure-app-service-check -p 80:5000 azure-app-service-check

docker run -d --rm --name azure-app-service-check -p 5000:5000 azure-app-service-check

# docker run -i --log-driver=none -a stdin -a stdout -a stderr

````

## Pull from GitHub Container Registry

````bash

docker pull ghcr.io/tonyskidmore/azure-app-service-check:latest

````
