pipeline {
    agent any

    stages {
        stage('Checkout code') {
            steps {
                checkout scm
                sh 'chmod +x run.sh'
                sh './run.sh'
            }
        }
    }
}
