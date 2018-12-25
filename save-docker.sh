docker ps
#display the last created container (-n 1) quietly (q), will give us the container id
id=`docker ps -n 1 -aq`
echo "here is the id: $id"
docker commit $id getintodevops/hellonode