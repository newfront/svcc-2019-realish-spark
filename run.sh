#!/bin/bash

# start zeppelin, redis
# stop zeppelin, redis
function startAll() {
    echo ">> Starting all"
    docker start zeppelin
    sleep 5
    docker start redis5
}

function stopAll() {
    docker stop zeppelin
    sleep 5
    docker stop redis5
    echo ">> Stopping all"
    docker rm zeppelin
    docker rm redis5
}

function info() {
    echo ">> Zeppelin"
    docker inspect zeppelin
}

function deploy() {

    docker rm -f `docker ps -aq` # delete old containers
    docker network rm svcc
    docker network create --driver bridge svcc

    # launch zeppelin docker container (forward ports from container 8080 -> host: 127.0.0.1:8088)
    docker run -d -p 8080:8080 --network svcc -v $PWD/logs:/logs -v $PWD/notebook:/notebook -v $PWD/data:/svccdata -e ZEPPELIN_LOG_DIR='/logs' -e ZEPPELIN_NOTEBOOK_DIR='/notebook' --name zeppelin -h zeppelin apache/zeppelin:0.8.1
    docker run --network svcc -p 6379:6379 --name redis5 -h redis5 -e ALLOW_EMPTY_PASSWORD=yes -dP redis redis-server
}

#export SPARK_HOME=~/Desktop/spark-2.4.4
function deployWithCustomSpark() {
    echo "Using SPARK_HOME=${SPARK_HOME}"
    #####################################################
    # Expectation: Spark is Installed and SPARK_HOME is an environment variable, and the location must be sharable from the OS. See Error Below
    # docker: Error response from daemon: Mounts denied: 
    # The path /usr/local/spark-2.4.4
    # is not shared from OS X and is not known to Docker.
    #####################################################
    docker rm -f `docker ps -aq` # delete old containers
    docker network rm svcc
    docker network create --driver bridge svcc
    docker run -d -p 8080:8080 -p 4040:4040 --network svcc -v $PWD/logs:/logs -v $PWD/notebook:/notebook -v $PWD/data:/svccdata -v $SPARK_HOME:/spark -e SPARK_HOME='/spark' -e ZEPPELIN_LOG_DIR='/logs' -e ZEPPELIN_NOTEBOOK_DIR='/notebook' --name zeppelin -h zeppelin apache/zeppelin:0.8.1
    docker run --network svcc -p 6379:6379 --name redis5 -h redis5 -e ALLOW_EMPTY_PASSWORD=yes -dP redis redis-server
}

function install() {
    exec ./install.sh
}

case "$1" in
    install)
        install
    ;;
    deploy)
        deploy
    ;;
    deployCustom)
        deployWithCustomSpark
    ;;
    start)
        startAll
    ;;
    stop)
        stopAll
    ;;
    info)
        info
    ;;
    *)
        echo $"Usage: $0 {install | deploy | deployWithCustomSpark | start | stop | info"
    ;;
esac
