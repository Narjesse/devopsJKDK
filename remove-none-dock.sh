tee= $(docker images | grep "<none>" |  awk '{print $3}')
if [ ! -z $tee  ] ; then  
docker rmi -f $(docker images | grep "<none>" |  awk '{print $3}'); 
fi