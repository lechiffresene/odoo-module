pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
                def DOCKERHUB_CREDENTIALS=credentials(‘cdelambert-dockerhub’)
                
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
    stage('Login') {
      steps {
            
             
             sh 'echo $DOCKERHUB_CREDENTIALS_PSW  | docker login -u $DOCKERHUB_CREDENTIALS_USR  —password-stdin'
             
             
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

