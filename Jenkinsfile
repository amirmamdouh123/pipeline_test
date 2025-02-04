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
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                }
            }
        }

        stage('process dockerfile and push') {
            steps {
                sh 'docker build -t amirmamdouh123/test-pipeline .'
                sh 'docker run -itd --name test-pipeline amirmamdouh123/test-pipeline'
                sh 'docker push amirmamdouh123/test-pipeline'
            }
        }
    }

    post {
        always {
            sh 'echo "Nice, I love you <3 ."'
        }
    }
}
