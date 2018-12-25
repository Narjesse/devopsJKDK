for package in git salt-master salt-minion wget ansible ; do 
#for package in git; do
  echo "--------------------------------"
  echo "NOW WITH THE COMMAND $package"
  echo "--------------------------------"
  $package --version
  if [ $? -ne 0 ]; then
    yum install -y $package
  fi
done
echo "--------------------------------"
echo "NOW WITH THE JAVA ALONE"
echo "--------------------------------"
#java -version
#if [ $? -ne 0 ]; then
yum install -y java-1.8.0-openjdk-devel
  echo "--------------------------------"
  echo "NOW WITH THE PACKAGE $package"
  echo "--------------------------------"
  yum list installed epel-release
  if [ $? -ne 0 ]; then
    yum install -y epel-release
  fi

#yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm

mvn --version
if [ $? -ne 0 ]; then
    wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
    sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
    yum install -y apache-maven
fi
