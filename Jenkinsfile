pipeline {
    agent any

    stages {

        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/thienc45/devops-automation'
            }
        }

        stage('Check Dockerfile') {
            steps {
                script {
                    def dockerfilePath = "${WORKSPACE}/Dockerfile"
                    if (fileExists(dockerfilePath)) {
                        echo "Dockerfile exists at ${dockerfilePath}"
                    } else {
                        echo "Dockerfile does not exist at ${dockerfilePath}"
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerfilePath = "${WORKSPACE}/Dockerfile"
                    if (fileExists(dockerfilePath)) {
                        echo "Building Docker image from Dockerfile at ${dockerfilePath}"
                        if (isUnix()) {
                            sh "docker build -t thienczai1/devopsautomation -f ${dockerfilePath} ."
                        } else {
                            bat "docker build -t thienczai1/devopsautomation -f ${dockerfilePath} ."
                        }
                    } else {
                        echo "Dockerfile does not exist at ${dockerfilePath}. Unable to build Docker image."
                    }
                }
            }
        }
    }
}
