docker ps
id=`docker ps -aqf "name=fervent_lumiere"`
docker commit $id getintodevops/hellonode