pipeline {
    agent any
   

    stages {
        stage('Checkout') {
            steps {
                cleanWs()
                checkout scm
            }
        }
    
        stage('Build AMI') {
            steps {
                dir('./packer') {
                    sh 'ls -la; pwd; packer validate template.json'
                }
            }
        }
    
        stage('Terraform Deploy') {
            steps {
                dir('./terraform') {
                  withCredentials([usernamePassword(credentialsId: 'aws_access_keys', usernameVariable: 'AWS_ACCESS_KEY', passwordVariable: 'AWS_SECRET_KEY')]) {
                    sh """
                        terraform init
                        terraform plan
                        terraform apply -auto-approve
                    """
                    } 
                }
            }
        }
    }
}
