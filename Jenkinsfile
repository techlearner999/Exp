pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/techlearner99/Exp.git'
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t devops-demo:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'DOCKER_HUB_PASS')]) {
                    bat 'docker login -u yourdockerhubusername -p %DOCKER_HUB_PASS%'
                    bat 'docker tag devops-demo:latest yourdockerhubusername/devops-demo:latest'
                    bat 'docker push yourdockerhubusername/devops-demo:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f k8s-deployment.yaml'
            }
        }
    }
}
