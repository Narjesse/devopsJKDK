node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }


    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        image_id = sh (script: "docker images -q getintodevops/hellonode", returnStdout: true).trim()
        if (image_id.isEmpty()) app = docker.build("getintodevops/hellonode")
        else app= docker.image(image_id)
    }
     stage('Salt deploy') {
	             app.inside {
         sh ' echo "master: localhost" > /etc/salt/minion'
         sh ' echo "file_roots:" > /etc/salt/master'
         sh ' echo "  base:" >> /etc/salt/master'
         sh 'echo "    - /srv/salt" >> /etc/salt/master'
		 sh 'touch /root/test123'
		 }
		 sh ('chmod +x save-docker.sh ')
		 sh ('./save-docker.sh')
		 }

      stage('Salt deploy end') {
	             app.inside {
         sh ' echo "finished"'
         
		 }
		 sh ('chmod +x remove-old-dock.sh ')
		 sh ('./remove-old-dock.sh')
}