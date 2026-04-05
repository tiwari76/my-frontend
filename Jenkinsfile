pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/tiwari76/web-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t tiwari76/web-project:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push tiwari76/web-project:latest'
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook /var/lib/jenkins/deploy.yml'
            }
        }
    }

    post {
        success { echo 'Deployed successfully!' }
        failure { echo 'Pipeline failed! Check logs above.' }
    }
}
