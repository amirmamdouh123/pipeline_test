pipeline {
    agent any

    stages {
        stage('pull github repo') {
            steps {
                git 'https://github.com/amirmamdouh123/pipeline_test'
            }
        }

        stage('login in dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhublogin', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo $PASSWORD |  docker login -u $USERNAME --password-stdin'
                }
            }
        }

        stage('process dockerfile and push') {
            steps {
                sh 'docker build -t amirmamdouh123/test-pipeline .'
                // sh 'docker run -itd --name test-pipeline amirmamdouh123/test-pipeline'
                sh 'docker push amirmamdouh123/test-pipeline'
            }
        }

        stage('deploy on minikube cluster') {
            steps {
                withCredentials([file(credentialsId: 'KUBECONFIG', variable: 'KUBECONFIG')]) {
                    sh 'kubectl get pods --kubeconfig $KUBECONFIG'
                }
            }
        }

    }

    post {
        always {
            sh 'echo "Nice, I love you <3 ."'
        }
    }
}
