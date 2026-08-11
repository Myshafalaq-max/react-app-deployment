pipeline {
    agent any

    stages {

        stage('Changing file permission') {
            steps {
                sh 'chmod +x build.sh'
            }
        }

        stage('Executing build') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh './build.sh'
                }
            }
        }
    }
}
