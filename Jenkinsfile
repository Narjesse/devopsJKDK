node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }


    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        /*image_id = sh (script: "docker images -q getintodevops/hellonode", returnStdout: true).trim()
        if (image_id.isEmpty()) app = docker.build("getintodevops/hellonode")
        else app= docker.image(image_id)*/
		app = docker.build("getintodevops/hellonode")

    }
     stage('Sve Image') {

		 sh ('chmod +x save-docker.sh ')
		 sh ('./save-docker.sh')
		 }

      stage('remove extra images') {
		/* sh ('chmod +x remove-old-dock.sh ')
		 sh ('./remove-old-dock.sh')*/
}
}