docker ps
id=`docker ps -aqf "name=fervent_lumiere"`
docker commit $id getintodevops/hellonode
docker rmi -f $(docker images | grep "^<none>" |  awk '{print $3}')