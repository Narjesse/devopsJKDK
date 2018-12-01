for package in git tmux vim salt-master salt-minion wget; do 
#for package in git; do
  echo "--------------------------------"
  echo "NOW WITH THE COMMAND $package"
  echo "--------------------------------"
  $package --version
  if [ $? -ne 0 ]; then
    yum install -y $package
  fi
done
for package in epel-release java-1.8.0-openjdk-devel.x86_64; do 
#for package in git; do
  echo "--------------------------------"
  echo "NOW WITH THE PACKAGE $package"
  echo "--------------------------------"
  yum list installed $package
  if [ $? -ne 0 ]; then
    yum install -y $package
  fi
done
yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm

mvn --version
if [ $? -ne 0 ]; then
    wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
    sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
    yum install -y apache-maven
fi
export JAVA_HOME="/usr/lib/jvm" 
echo "++++++++++++++++++++ JAVA_HOME is $JAVA_HOME"
