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

		 }
		 
		 }
/*		 
    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) 

        app.inside {
         sh ('chmod +x required-packages-dock.sh ')
         sh ('chmod +x remove-old-dock.sh ')
         sh ('touch /root/test ; echo Test >> /root/test; pwd')
         sh ('echo "***********LETS CHECK IF WE HAVE ALL PACKAGES WITHIN THE DOCKER IMAGE********"')
         sh ('./required-packages-dock.sh')
         sh ('echo "******FINISHED CHECKING IF WE HAVE ALL PACKAGES WITHIN THE DOCKER IMAGE*******"')
         sh 'cd RepoOne; mvn -B -X -DskipTests clean package'
         sh 'cd RepoOne; mvn -X test'
    }
		*/
		 /* sh 'echo "this is id"'
         sh 'id'
         sh'java -version'
         sh 'yum install java-1.8.0-openjdk-devel'
         sh 'echo "+++++++++++++++++-------------+++++++++++"'
         sh 'pwd ; hostname ; ls -l; mkdir /root/YESHERE; export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64; echo "java home is $JAVA_HOME"'
         sh 'ls -l /usr/lib/jvm' 
	}*/

 stage('Push image') { 
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
         sh ('./remove-old-dock.sh')
        }

  /*  ALL the following is commented
  stage('Build Maven code') { 
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. 
           dir('RepoOne') {
        git url: 'https://github.com/Narjesse/simple-java-maven-app'
       /* sh('mvn -B -DskipTests clean package')
    }
    
        }*/
 /* ALL the following is commented
 stage('Test Maven Project') {
               app.inside {
               dir('RepoOne') {
                sh 'echo "this is id"'
                sh 'id'
                sh'java -version'
                sh 'yum install java-1.8.0-openjdk-devel'
                sh 'echo "+++++++++++++++++-------------+++++++++++"'
                sh 'pwd ; hostname ; ls -l; mkdir /root/YESHERE; export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64; echo "java home is $JAVA_HOME"'
                sh 'ls -l /usr/lib/jvm' 
                sh 'cd RepoOne; mvn -B -X -DskipTests clean package'
             /*   sh 'cd RepoOne; mvn -X test'
                sh './jenkins/scripts/deliver.sh'  
                    }
}
         /*   post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            } 
        }*/
     
}