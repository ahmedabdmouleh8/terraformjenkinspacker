pipeline {
    agent any
   
    environment {
        access_key = 'AKIA6MZR5ZG6C4DT6HXV'
        secret_key = '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'
    }
  
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
                        terraform validate
                        terraform init
                        terraform plan
                        terraform apply -auto-approve -var access_key=${access_key} -var secret_key=${secret_key}
                    """
                    } 
                }
            }
        }
    }
}
