pipeline {

    environment {
        DOCKER_HUB_REGISTRY = "deusdimitrius/epam_exam"
	DOCKER_HUB_CREDENTIALS = 'dockerhub'
	DOCKER_IMAGE = ''
    }

    agent any
    
    stages {

     stage ('Application tests') {
      steps {
             sh """
                python3 -m venv venv
                . venv/bin/activate
                pip install -e .
                export FLASK_APP=js_example
                pip install -e '.[test]'
                coverage run -m pytest
                coverage report
                deactivate
                """
	   }
     }

     stage("Build") {
      steps { 
              script {
               DOCKER_IMAGE = docker.build DOCKER_HUB_REGISTRY + ":flaskapp"
              }
            }
     }

     stage ('Push into DockerHub.com') {
       steps { 
               script {
                        docker.withRegistry( '', DOCKER_HUB_CREDENTIALS ) {
                        DOCKER_IMAGE.push()
                        }
                      }
       }
      }
     }
}
