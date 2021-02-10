Stack:
Docker, Symfony 5, Mysql 5.7, php 7, nginx

1. Install docker-compose
https://docs.docker.com/compose/install/

2. Run local dev env 
``cd docker/local && bash deploy.sh``

3. Run composer install
``docker exec -it project_name_php composer install``

4. Run example command
``docker exec -it project_name_php bin/console project_name:example``
