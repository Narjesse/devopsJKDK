docker ps
#display the last created container (-n 1) quietly (q), will give us the container id
id=`docker ps -n 1 -aq`
docker commit $id getintodevops/hellonode