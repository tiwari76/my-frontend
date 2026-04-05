pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t sonu942/my-frontend:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push sonu942/my-frontend:latest'
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
