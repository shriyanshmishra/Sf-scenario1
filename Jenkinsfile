pipeline {
    agent any
    environment {
        // This variable name must match the ID you set in Jenkins Credentials
        SF_TOKEN = credentials('SF_AUTH_URL_AMIT')
    }
    stages {
        stage('Checkout Source') {
            steps {
                checkout scm
            }
        }
        stage('Authenticate to Org') {
            steps {
                // Creates a temporary file for the login process
                sh 'echo $SF_TOKEN > ./sfdx_url.txt'
                sh 'sf org login sfdx-url --sfdx-url-file ./sfdx_url.txt --alias targetOrg --set-default'
            }
        }
        stage('Validate Metadata') {
            steps {
                // This is the "Check-Only" deployment that proves the code works
                sh 'sf project deploy validate --manifest manifest/package.xml --target-org targetOrg'
            }
        }
    }
    post {
        always {
            // Cleanup the sensitive file so it's not left on the Jenkins server
            sh 'rm -f ./sfdx_url.txt'
        }
    }
}