pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
                
            }


  stages {
    stage('Checkout') {
      steps {
        
        git(  url: 'https://github.com/lechiffresene/odoo-module.git', branch: 'stagging' ) 
        
      }
    }

    stage('Build Docker Image') {
      steps {
             sh "docker build -t auguria/odoo-module:${shortCommit} ."
      }
    }

    stage('Push Docker Image') {
      steps {
        
             sh "docker push auguria/odoo-module:${shortCommit} "
      }
    }

     stage('clean image') {
      steps {
        
             sh "docker rmi -t auguria/odoo-module:${shortCommit} "
      }
    }
  }
}

