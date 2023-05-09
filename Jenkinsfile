pipeline {
    agent any
   
    environment {
        terraform_version = '0.11.11'
        packer_version = '1.4.3'
        access_key = 'AKIA6MZR5ZG6C4DT6HXV'
        secret_key = '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'
    }
  
    stages {
        stage('Checkout') {
            // Clean the workspace
            cleanWs()
            // Get some code from a GitHub repository
            checkout scm
        }
        
        stage('Build AMI') {
            steps {
                dir('./packer') {
                    sh 'ls -la; pwd; packer build template.json'
                }
            }
        }
              
        stage('Terraform Deploy') {
            steps {
                dir('./terraform') {
                    sh """
                        terraform init
                        terraform plan
                        terraform apply -auto-approve -var 'access_key=$access_key' -var 'secret_key=$secret_key'
                    """
                }
            }
        }
    }
}
