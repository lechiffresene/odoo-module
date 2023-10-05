pipeline {

    agent any 

    environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
            }


    stages {

            stage('Create  addons directories ') {
 
            steps {
                sh "mkdir -p enterprise_addons  "
            }
 
            }

            stage('Add entreprise addons') {

                steps {
                    script {
                        dir('odoo-enterprise') {
                            sh "rm -rf ./*"
                            git(  url: 'git@github.com:lechiffresene/odoo-module.git', branch: 'stagging' )
                            sh " cp -r ./odoo/addons/*  ../enterprise_addons   "
                            sh " ls -lh ../enterprise_addons"
                        }
                    }
                }
            
            }

            stage('Build image') {

                steps {
                        sh "docker build -t cdelambert/odoo-auguria:${shortCommit}  ."


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