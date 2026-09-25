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
