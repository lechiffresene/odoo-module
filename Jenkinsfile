pipeline {

    agent any 

    environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()
                DOCKERHUB_CREDENTIALS = credentials('jenkins-hub')
            }
    stages {

            stage('Create  addons directories ') {
 
            steps {
                sh "mkdir -p enterprise_addons  "
            }
 
            }


             
    stage('Checkout') {
      steps {
        
        git(  url: 'https://github.com/lechiffresene/odoo-module.git', branch: 'stagging' ) 
        
      }
    }

            stage('Add enterprise  addons  ') {
                when {
                        branch ‘stagging’
               }

                steps {
                    sh " cp -r ./chorus_account \
                            ./enterprise_addons/  && ls ./enterprise_addons "
                     }
                  }

            stage('Build image') {

                steps {
                        sh "docker build -t cdelambert/odoo-auguria:${shortCommit}  ."


                }
            }

            stage('Login') {
                steps {
                         sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                 
                }
            }


            stage('Push image') {
                
                steps {
                        sh "docker push cdelambert/odoo-auguria:${shortCommit} "


                }
            }

            stage('Clean image') {
                
                steps {
                        sh "docker rmi cdelambert/odoo-auguria:${shortCommit} "

                }
            }
           
    }

}
