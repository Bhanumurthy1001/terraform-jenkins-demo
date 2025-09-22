pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_DEFAULT_REGION    = "us-east-1"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Bhanumurthy1001/terraform-jenkins-demo.git'
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
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Destroy') {
            when {
                expression { return params.DESTROY == true }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    parameters {
        booleanParam(
            defaultValue: false,
            description: 'Check this to destroy infra instead of apply',
            name: 'DESTROY'
        )
    }
}
