for package in epel-release git tmux vim salt-master salt-minion wget; do 
  if $? eq 1; then
    yum install -y $package
  fi
done
yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm