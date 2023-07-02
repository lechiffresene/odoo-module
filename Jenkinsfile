pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()
                registryCredentials = 'dockerhub_credentials'  
                
                
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

    stage('Docker Login') {
    steps {
        script {
            docker.withRegistry('https://index.docker.io/v1/', registryCredentials) {
               
            }
        }

    stage('Push Docker Image') {
      steps {
            
          
             sh "docker push cdelambert/odooauguria:${shortCommit} "
             
             
      }
    }

     stage('clean image') {
      steps {
        
             sh "docker rmi -t cdelambert/odooauguria:${shortCommit} "
      }
    }
  }
}

