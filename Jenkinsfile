pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'thienczai1/devopsautomation:latest'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
        TAG_NAME = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
              git branch: 'main', credentialsId: 'docker-hub-credentials', url: 'https://github.com/thienc45/devops-automation'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                        echo "DOCKER_USERNAME: $DOCKER_USERNAME"
                        echo "DOCKER_PASSWORD: $DOCKER_PASSWORD" // Do not use this in production!


                    // Push Docker image to Docker Hub
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                        sh "docker push $DOCKER_IMAGE"
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
