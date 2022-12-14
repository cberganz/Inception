# Inception
**A Docker LEMP stack small infrastructure**

#### Stateless vs Stateful
>A MySQL database is stateful: it stores a state. If you switch your database off and on again, you will find it in the same state.

>An HTTP protocol is stateless: the application does not store any state. With each new HTTP request, the same series of actions will be performed.

#### **A container is immutable**
>A container does not ensure the durability of data. In this case, a volume will have to be created to store the data in a perennial way.

## Get started with Docker
### Docker installation
##### System update and dependencies installation
```
sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
```
##### Get Docker repository
```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
```
##### Installation of Docker itself
```
sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io
```
##### Get daemon access
```
sudo usermod -aG docker your-user
```
**At this point, a reboot of the user session will be necessary.**
##### Ensure the installation has worked correcly
```
docker run hello-world
```
**A message should appear confirming the installation has worked correctly.**

### Docker usage
##### Get a local image from Docker Hub
```
docker pull DOCKER_NAME
```
##### Start a Docker
```
docker run [OPTIONAL ARGUMENTS] DOCKER_NAME
```
**Flags :**
**-d :** Detach the container from your console main process.
**-p :** Specify ports.

##### Enter inside a container
```
docker exec -ti DOCKER_ID bash
```
**-ti argument allows a fully operational bash**

##### Stop a container
```
docker stop DOCKER_ID
```
```
docker rm DOCKER_ID
```
##### Show all existing Dockers
```
docker ps
```
##### Show all local images
```
decker images -a
```
##### Clean system
```
docker system prune
```
### Dockerfile
FROM which allows you to define the source image;
```
FROM debian:10
```
RUN which allows you to execute commands in your container. This command will create a new layer and the calls to it should be limited as much as possible to limit the size of the container.
```
RUN apt-get update -y
    && apt-get install curl gnupp -yp
```
ADD which allows you to add files to your container (The following exemple will copy the current working directory from the host inside the FOLDER_NAME of the container)
```
ADD . /FOLDER_NAME/
```
WORKDIR which allows you to define working directory at launch of the container
```
WORKDIR /FOLDER_NAME
```
EXPOSE which allows you to define the default listening ports
```
EXPOSE 8080
```
VOLUME which allows you to define the usable volumes. In fact, you can share volumes between the host and the container.
```
VOLUME /app/logs
```
CMD which allows you to define the default command when running your Docker containers
```
CMD ./a.out
```
### Docker ignore

Put a ".dockerignore" file in the Dockerfile directory to avoid copying selected files when running the command ADD.

### Use the registry
#### Store an image on the registry
- 1 - Connect to the Docker Hub : https://hub.docker.com
- 2 - Click on "Create directory" and chose the image name
- 3 - Publish the image :
```
docker tag IMAGE_NAME:latest YOUR_USERNAME/DOCKER_NAME:latest
```
or
```
docker tag IMAGE_ID:latest YOUR_USERNAME/DOCKER_NAME:latest
```
*latest : this allows versionning. You can name the version as you want. Just keep in mind the latest will be called by default when you run it.
#### Get an image from the registry
Show the list of images for a name pattern :
```
Docker search IMAGE_NAME
```
Get an image :
```
docker pull IMAGE_NAME
```


### Some Docker vocabulary
dockerfile
recette
layer


