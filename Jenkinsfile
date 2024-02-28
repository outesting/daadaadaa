pipeline {
    agent any

    stages {
        stage('Checkout code') {
            steps {
                checkout scm
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
    }
}
