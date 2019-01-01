node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
		       sh ('docker stop devops-image || echo "no such container"; docker rm -f devops-image || echo "no such container"')
    }


    stage('Build image') {

	    
		app = docker.build("narjess6/built-from-jenkins:latest")
		docker.image("narjess6/built-from-jenkins").run("--name devops-image -i")
		/*sh ('docker run -i --name=devops-image docker.io/narjess6/built-from-jenkins:latest /bin/bash')*/

    }
	
	 stage('Use Ansible in docker') {
      
	   
       sh (' ansible-playbook -i /root/firstRoleAnsible/tasks/inventory /root/firstRoleAnsible/tasks/main.yml')
	   
	   }
     
	 
	 stage('Sve Image') {
/* fait partie des ficihers copiés à partir de git repo localement dans la VM ou tourne jenkins, et pas dans le docker image*/
	 sh ('chmod +x save-docker.sh ')
	 sh (' ./save-docker.sh')
		app.push("latest")
		 }

      stage('remove extra images') {
	      sh ('docker stop devops-image || echo "no such container"; docker rm -f devops-image || echo "no such container"')
		 sh ('chmod +x remove-none-dock.sh ')
		/* sh ('./remove-none-dock.sh')
		 sh ('python remove-extra-notnone-dock.py')*/
}
}