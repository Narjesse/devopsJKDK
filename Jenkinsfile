node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
		       sh ('docker rm devops-image')
    }


    stage('Build image') {

	    
		app = docker.build("narjess6/built-from-jenkins")
		

    }
	
	 stage('Use Ansible in docker') {
      
	   sh ('docker run -i --name=devops-image docker.io/narjess6/built-from-jenkins:latest /bin/bash')
       sh (' ansible-playbook -i /root/firstRoleAnsible/tasks/inventory /root/firstRoleAnsible/tasks/main.yml')
	   
	   }
     
	 
	 stage('Sve Image') {

		app.push("latest")
		 }

      stage('remove extra images') {
	     sh ('docker rm devops-image')
		 sh ('chmod +x remove-none-dock.sh ')
		 sh ('./remove-none-dock.sh')
		 sh ('python remove-extra-notnone-dock.py')
}
}