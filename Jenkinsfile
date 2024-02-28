pipeline {
    agent any

    stages {
        stage('Checkout code') {
            steps {
                checkout scm
                sh 'echo requirements.txt'
            }
        }
    }
}
