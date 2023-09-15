pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()
                //DOCKER_REGISTRY_CREDENTIALS = credentials('auguria-dockerhb')
                //DOCKER_IMAGE = "cdelambert/odooauguria:${shortCommit}"
                

                
                
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
                     
            
             docker.withRegistry('https://hub.docker.com/repository/docker/cdelambert/','auguria-dockerhb') {
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