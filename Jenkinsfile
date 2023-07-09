pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()
                def dockerRegistry = 'https://hub.docker.com/repository/docker/cdelambert/odooauguria'    
                def dockerUsername = 'docker@auguria.fr'
                def dockerPassword = credentials('auguria-dockerhb')

                
                
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
            
             docker.withRegistry(dockerRegistry, dockerUsername, dockerPassword){
             sh "docker push cdelambert/odooauguria:${shortCommit} "
             
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

