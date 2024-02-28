pipeline {
    agent any

    stages {
        stage('Checkout code') {
            steps {
                checkout scm
                sh './test.sh'
            }
        }
    }
}
