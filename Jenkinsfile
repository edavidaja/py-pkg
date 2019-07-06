pipeline {
    agent any
    stages {
        stage('prep') {
            steps {
                sh 'make prep'
            }
        }
        stage('build') {
            steps {
                sh 'make build-containers'
            }
        }
        stage('package') {
            steps {
                sh 'make create-pkg'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'output/*/*', fingerprint: true
        }
    }
}
