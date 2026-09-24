step1: create a one folder, in that again create a three folder for three service.

step2: Each folder, have two files one is index.html it contains application code and second file is dockerfile, it contains baseimage and copy the application code from local to container.

step3: Build a images using command [docker-compose build]

step4: Create a container using acommand [docker-compose up -d]

Commands:

1. docker-compose ps        ---- list only the docker-compose container

2. compose images           ---- list only the docker-compose images

3. docker-compose pause     ---- it pause the container.

4. docker-compose unpause   ---- unpause the containers

5. docker-compose config    ---- it shows the configuration details

6. docker-compose start

7. docker-compose down      ---- it will stop the containers and delete the container.

8. docker-compose up -d     ---- it will create the containers
