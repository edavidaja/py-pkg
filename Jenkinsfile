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
                sh 'make create-pkg ${BUILD_NUMBER}'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'python*.deb', fingerprint: true
        }
    }
}
