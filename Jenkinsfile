node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }


    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        /*image_id = sh (script: "docker images -q narjess6/built-from-jenkins", returnStdout: true).trim()
        if (image_id.isEmpty()) app = docker.build("narjess6/built-from-jenkins")
        else app= docker.image(image_id)*/
		app = docker.build("narjess6/built-from-jenkins")
		

    }
	
	 stage('Use Ansible in docker') {
	   sh ('cd /root/firstRoleAnsible/tasks')
	   sh (' ansible-playbook -i inventory main.yml')
	   
	   
	   }
     
	 
	 stage('Sve Image') {

		app.push("latest")
		 }

      stage('remove extra images') {
		 sh ('chmod +x remove-none-dock.sh ')
		 sh ('./remove-none-dock.sh')
		 sh ('python remove-extra-notnone-dock.py')
}
}