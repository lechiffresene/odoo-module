pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()
                DOCKERHUB_CREDENTIALS= credentials('auguria-dockerhb')
                DOCKER_IMAGE = "cdelambert/odooauguria:${shortCommit}"
                

      
                
            }


  stages {
    stage('Checkout') {
      steps {
        
        git(  url: 'https://github.com/lechiffresene/odoo-module.git', branch: 'stagging' ) 
        
      }
    }

    stage('Build Docker Image') {
      steps {
             sh "docker build -t cdelambert/odooauguria:${shortCommit} ."
      }
    }
   

    stage('Push Docker Image') {
      steps {        
            
             script {
                    // Authenticate with Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'DOCKERHUB_CREDENTIALS') {
                    // Push the Docker image to Docker Hub
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            
             
       }      
      }
      
      
      
    stage('clean image') {
      steps {
        
             sh "docker rmi -t cdelambert/odooauguria:${shortCommit} "
      }
    }
  }
 }