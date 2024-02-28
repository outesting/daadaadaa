pipeline {
    agent any

    stages {
        stage('Checkout code') {
            steps {
                checkout scm
                sh 'cat requirements.txt'
            }
        }
    }
}
