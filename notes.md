### Redis Docker
https://hub.docker.com/_/redis

`docker pull redis`

~~~
docker network rm svcc
docker network create --driver bridge svcc
docker run --network svcc -p 6379:6379 --name redis5 -h redis5 -e ALLOW_EMPTY_PASSWORD=yes -dP redis redis-server
~~~

#### Stop Redis
~~~
docker stop redis5
docker rm redis5
~~~

#### Jump on the Redis Docker Container
~~~
docker exec -it redis5 bash
~~~

#### Inspect the Redis Docker Container
~~~
docker inspect redis5
~~~


#### Create Redis Docker
~~~
docker network rm reports
docker network create --driver bridge reports
docker run --network reports -p 6379:6379 --name redis5 -h redis5 -e ALLOW_EMPTY_PASSWORD=yes -dP redis redis-server
~~~

#### Connect locally via RedisCli
assuming you have redis downloaded on your laptop
~~~
redis-cli
~~~

If you have no redis installed. Then.

~~~
docker exec -it redis5 redis-cli
~~~

#### Jump on the Redis Docker Container
~~~
docker exec -it redis5 bash
~~~

#### Inspect the Redis Docker Runtime Information
~~~
docker inspect redis5
~~~

#### Stop Redis
~~~
docker stop redis5
docker rm redis5
~~~