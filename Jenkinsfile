pipeline {
    agent any

    environment {
        IMAGE_NAME = "ipushprajmishra/jenkins-demo"   // Change to your Docker Hub username
        IMAGE_TAG = "build-${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }

        stage('List Images') {
            steps {
                sh 'docker images | grep jenkins-demo'
            }
        }
    }

    post {
        success {
            echo "✅ Build successful: $IMAGE_NAME:$IMAGE_TAG"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
