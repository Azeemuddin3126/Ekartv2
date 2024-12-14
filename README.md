# CI-CD-pipeline-for-java-app
Build a complete CI/CD pipeline for Java app with Mysql server using Docker, Docker-compose, Github Actions, Kubernetes

### In this project i applied some skills and knowledge:
  * create Docker as container technology  for Spring Boot App
  * Write Docker Compose configurations in YAML file
  * Set Spring Boot Docker Compose Environment variables.
  * create Github actions that includes building app and running tests stags (CI part):
      -  https://github.com/shimaa829/CI-CD-pipeline-java-app/actions/runs/1441944155
  * use Kubernetes as orchestration technology to deploy the application by running ./kubernetes/run-kubernetes.sh:
      - build dockerized image of the application
      - Push the image to dockerHub:
          https://hub.docker.com/repository/docker/shimaa96/maven-image
      - create the deployment and service YAML files for the API and MYSQL.
   
 ** Also in this repository apply Simple Terraform IaaC template to provision a single server in availability zone a, with a
20GB operating system root volume, and 100GB locally attached data volume.


