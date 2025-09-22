pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Bhanumurthy1001/terraform-jenkins-demo.git'
            }
        }

        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply') {
            steps {
                input message: "Approve Terraform Apply?"
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/terraform.tfstate', fingerprint: true
        }
    }
}
