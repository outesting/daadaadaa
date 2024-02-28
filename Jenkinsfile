pipeline {
    agent any

    environment {
        AZURE_ACCOUNT_NAME = credentials('AZURE_ACCOUNT_NAME')
        AZURE_ACCOUNT_KEY = credentals('AZURE_ACCOUNT_KEY')
        TECHDOCS_BLOB_STORAGE_NAME = credentials('TECHDOCS_BLOB_STORAGE_NAME')
        ENTITY_NAMESPACE = 'default'
        ENTITY_KIND = 'Component'
        ENTITY_NAME = 'my-doc-entity'
    }

    stages {
        stage('Checkout code') {
            steps {
                checkout scm
            }
        }

        stage('Setup Node.js and Python') {
            steps {
                sh 'curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -'
                sh 'sudo apt-get install -y nodejs'
                sh 'sudo apt-get install -y python3.9'
            }
        }

        stage('Install techdocs-cli') {
            steps {
                sh 'sudo npm install -g @techdocs/cli'
            }
        }

        stage('Install mkdocs and mkdocs plugins') {
            steps {
                sh 'python3.9 -m pip install mkdocs-techdocs-core==1.*'
            }
        }

        stage('Generate docs site') {
            steps {
                sh 'techdocs-cli generate --no-docker --verbose'
            }
        }

        stage('Publish docs site') {
            steps {
                sh 'techdocs-cli publish --publisher-type azureBlobStorage --azureAccountName $AZURE_ACCOUNT_NAME --azureAccountKey $AZURE_ACCOUNT_KEY --storage-name $TECHDOCS_BLOB_STORAGE_NAME --entity $ENTITY_NAMESPACE/$ENTITY_KIND/$ENTITY_NAME'
            }
        }
    }
}
