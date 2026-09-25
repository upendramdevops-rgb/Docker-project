# Docker-project

Docker practice repository for learning common Dockerfile instructions and image workflows.

## 📂 Current Examples

*   **FROM/Dockerfile** - Base image example using AlmaLinux.
*   **RUN/Dockerfile** - Installs nginx during image build.
*   **CMD/Dockerfile** - Starts nginx in the foreground.
*   **EXPOSE/Dockerfile** - Reserved for port documentation practice.
*   **LABEL/Dockerfile** - Reserved for image metadata practice.

## 🛠️ Build Order

Build the images in this order because later Dockerfiles depend on earlier local image tags.

```bash
cd FROM
docker build -t from:v1 .

cd ../RUN
docker build -t run:v1 .

cd ../CMD
docker build -t cmd:v1 .

🚀 Docker Hub Push
Tag the local image with your Docker Hub username before pushing.

bash
docker tag run:v1 upendra9010/run:v1
docker push upendra9010/run:v1
🚨 Fix: Push Access Denied
If push fails with this error:
denied: requested access to the resource is denied

It usually means the EC2 machine is not logged in to Docker Hub as the correct user, or the repository does not exist in Docker Hub.

1. Login again:

bash
docker logout
docker login -u upendra9010
Note: If Docker Hub 2FA is enabled, use a Docker Hub personal access token instead of the account password.

2. Then push again:

bash
docker push upendra9010/run:v1
3. If it still fails, create the repository first in Docker Hub:

Repository name: run

Namespace: upendra9010

Visibility: Public or Private

Then retry:

bash
docker push upendra9010/run:v1


🐳 Docker Important Commands Cheat Sheet
1. 📦 Image Management (Build & List)
These commands are used to create and manage your Docker images.

# Build an image from a Dockerfile in the current directory
docker build -t upendra9010/myapp:v1 .

# Build an image with a specific Dockerfile name
docker build -f Dockerfile.dev -t upendra9010/myapp:dev .

# List all local images
docker images

# Remove a specific image (must stop containers using it first)
docker rmi upendra9010/myapp:v1

# Remove all unused images (dangling images)
docker image prune

# Remove ALL unused images (not just dangling)
docker image prune -a

2. 🏃 Container Management (Run & Manage)
These commands are used to run and manage your containers.

# Run a container in detached mode (background) with port mapping
# -d (detached), -p (host_port:container_port)
docker run -d -p 8080:80 --name myapp-container upendra9010/myapp:v1

# Run a container interactively (great for debugging)
# -i (interactive), -t (pseudo-TTY)
docker run -it upendra9010/myapp:v1 /bin/bash

# List all running containers
docker ps

# List ALL containers (including stopped ones)
docker ps -a

# Stop a running container
docker stop myapp-container

# Start a stopped container
docker start myapp-container

# Remove a stopped container
docker rm myapp-container

# View logs of a container
docker logs myapp-container

# Follow live logs
docker logs -f myapp-container

# Execute a command inside a running container (e.g., open a bash shell)
docker exec -it myapp-container /bin/bash

# Inspect detailed container info (IP address, mounts, etc.)
docker inspect myapp-container

3. 🌐 Docker Hub / Registry (Push & Pull)
Use these commands to interact with Docker Hub (upendra9010).

# Login to Docker Hub
docker login -u upendra9010

# Logout
docker logout

# Tag a local image for Docker Hub (must match your username)
docker tag run:v1 upendra9010/run:v1

# Push an image to Docker Hub
docker push upendra9010/run:v1

# Pull an image from Docker Hub
docker pull upendra9010/run:v1

# Search for an image on Docker Hub
docker search nginx

4. 💾 Volumes & Networks (Data & Communication)
Essential for persisting data and connecting containers.

# Create a volume
docker volume create mydata

# List volumes
docker volume ls

# Run a container with a mounted volume
docker run -d -v mydata:/var/lib/mysql mysql

# Remove a volume
docker volume rm mydata

# Create a network
docker network create mynetwork

# List networks
docker network ls

# Run a container attached to a specific network
docker run -d --network mynetwork --name db mysql

5. 🧹 System Cleanup (Free up space)
EC2 instances can fill up fast. Use these to clean up.

# See disk usage of images, containers, and volumes
docker system df

# Remove all stopped containers, unused networks, dangling images, and build cache
docker system prune

# Nuclear option: Remove EVERYTHING not currently used (stopped containers, all unused images, unused volumes)
docker system prune -a --volumes


