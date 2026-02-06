pipeline {
    agent any

    tools {
        maven "Maven-3.9.12"
    }

    environment {
        IMAGE_NAME = "testinguser1709/chocolatyarenaapp"
        IMAGE_TAG  = "latest"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Raghav-539/the_chocolaty_arena.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                      echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                      docker push $IMAGE_NAME:$IMAGE_TAG
                    '''
                }
            }
        }

        stage('Kubernetes Deployment') {
            steps {
                sh 'kubectl rollout restart deployment chocolatyarenaappdeployment'
            }
        }
    }
}
