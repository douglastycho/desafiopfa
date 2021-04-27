# Desafio 1


- Crie um programa utilizando sua linguagem de programação favorita que faça uma listagem simples do nome de alguns módulos do curso Full Cycle os trazendo de um banco de dados MySQL. Gere a imagem desse container e a publique no DockerHub.

- Gere uma imagem do nginx que seja capaz que receber as solicitações http e encaminhá-las para o container.

- Crie um repositório no github com todo o fonte do programa e das imagens geradas.

- Crie um arquivo README.md especificando quais comandos precisamos executar para que a aplicação funcione recebendo as solicitações na porta 8080 de nosso computador. Lembrando que ```NÃO utilizaremos Docker-compose``` nesse desafio.



# Imagens


Primeiro é necessário baixar as imagens do hub docker. (Obs: Caso queira iniciar as imagens direto das pastas pode pular para a seção [Preparando as Imagens](#Preparando-as-Imagens))

```sh
    docker push douglasdevops/mysql-pfa:prod
    docker push douglasdevops/node-pfa:prod
    docker push douglasdevops/nginx-pfa:prod
```



# Preparando as Imagens


> Note: Tenha certeza que está dentro do ```folder raiz do projeto```.

Comece fazendo o build das imagens caso não tenha baixado no hub docker em [Imagens](#Imagens)

Build Mysql
```sh
    docker build -t douglasdevops/mysql-pfa:prod mysql
```

Build Node
```sh
    docker build -t douglasdevops/node-pfa:prod node
```

Build Nginx
```sh
    docker build -t douglasdevops/nginx-pfa:prod nginx
```



# Iniciando Containers


Crie a Network
```sh
docker network create --driver bridge doug-pfa-network
```



## Execute as imagens


Executando a imagem do Mysql
```sh
    docker run -it -d --network doug-pfa-network --name mysql-pfa -v $(pwd)/mysql/.data:/var/lib/mysql douglasdevops/mysql-pfa:prod
```


Antes de continuar executando as outras imagens, popular o banco de dados com o seguinte comando:
```sh
docker exec -it mysql-pfa bash ./run_mysql.sh
```
Obs: Caso apareça o erro: ```ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)``` espere o container subir para rodar novamente o comando.


Executando a imagem do Node
```sh
    docker run -it -d --network doug-pfa-network --name node-pfa douglasdevops/node-pfa:prod
```


Executando a imagem do Nginx
```sh
    docker run -it -d --network doug-pfa-network --name nginx-pfa -p 8080:80 douglasdevops/nginx-pfa:prod
```



# Testando


Verifique se ```os 3 containers estão UP```:
```
docker ps | grep douglasdevops
```


Se estiverem up é só realizar o teste acessando: http://localhost:8080