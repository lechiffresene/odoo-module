pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()
                DOCKER_REGISTRY_CREDENTIALS = credentials('auguria-dockerhb')
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
            
            script {


              
             withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: DOCKER_REGISTRY_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS']]) {
                        // Connexion au registre Docker
             docker.withRegistry('', DOCKER_USER, DOCKER_PASS) {
             sh "docker push cdelambert/odooauguria:${shortCommit} "
            
             
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