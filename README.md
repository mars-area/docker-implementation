Cheatsheet
==========
This is cheatsheet for docker commands.

# Docker commands
## Docker images
```bash
# List images
docker image ls

# Build image
docker build -t <image_name> .

# Remove image
docker image rm <image_id>
```

## Docker containers
```bash
# List containers
docker container ls
docker ps
docker ps -a

# Run container
docker run -p <host_port>:<container_port> -d --name <container_name> <image_name>

# Stop container
docker stop <container_id/container_name>

# Remove container
docker rm <container_id/container_name>

# Login to container
docker exec -it <container_id/container_name> bash
## Check container env
printenv

# Exit from container
exit

# Logs
docker logs <container_id/container_name>

# Sync files from local to container
docker run -v <folder_path_in_local>:<folder_path_in_container> -p <host_port>:<container_port> -d --name <container_name> <image_name>
# Example
docker run -v /home/username/project:/app -p 80:80 -d --name my-app my-app-image
## Windows Powershell
docker run -v ${pwd}:/app -p 80:80 -d --name my-app my-app-image
### Anonymouse volume
docker run -v ${pwd}:/app:ro -v /app/node_modules -p 80:80 -d --name my-app my-app-image
### With env
docker run -v ${pwd}:/app -v /app/node_modules --env PORT=8080 -p 8000:8080 -d --name my-app my-app-image
### Load env from file
docker run -v ${pwd}:/app -v /app/node_modules --env-file .env -p 8000:8080 -d --name my-app my-app-image
## Windows CMD
docker run -v %cd%:/app -p 80:80 -d --name my-app my-app-image
## Mac/Linux
docker run -v $(pwd):/app -p 80:80 -d --name my-app my-app-image
```

## Docker compose
```bash
# Run with deatached mode
docker-compose up -d
# Force rebuild
docker-compose up -d --build
# Run with different compose file
docker-compose -f <compose_file_name> -f <compose_file_name> up -d

# To tear down everything with volumes
docker-compose down -v
```